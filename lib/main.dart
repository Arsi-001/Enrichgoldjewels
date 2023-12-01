import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gold_application_project/Alerts.dart';
import 'package:gold_application_project/Contact.dart';
import 'package:gold_application_project/LiveChart.dart';
import 'package:gold_application_project/Splash.dart';
import 'package:gold_application_project/UserProvider.dart';
import 'package:gold_application_project/aboutpage.dart';
import 'package:gold_application_project/noti.dart';
import 'package:gold_application_project/pop_Dialog.dart';
import 'package:gold_application_project/product.dart';
import 'package:web_socket_channel/io.dart';
import 'Whatapplauncher.dart';
import 'constant.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => RateData())],
      child: ScreenUtilInit(
        designSize: const Size(430, 930),
        builder: (context, child) => MaterialApp(
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.copyWith(textScaleFactor: 1.0);
            return MediaQuery(
              child: child!,
              data: scale,
            );
          },
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.val, required this.State1});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  final val, State1;
}

class _MyHomePageState extends State<MyHomePage> {
// Call the function and store the token for later use

  final serverUrl = 'www.server.enrich.codexflow.co';
  bool channelOpen = false;

  final port = 8080;
  WebSocket? socket;

  IOWebSocketChannel? channel;
  String? authToken;

  Future<void> generateAuthToken() async {
    final url = 'http://$serverUrl/generate-token';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        authToken = jsonResponse['token'];
        print(authToken);
        print('bearer $authToken');
        _establishWebSocketConnection();
      });
    } else {
      print('Failed to generate authentication token');
    }
  }

  void _establishWebSocketConnection() {
    print("Start");
    if (authToken != null) {
      final headers = {
        'Authorization': 'bearer $authToken',
      };
      WebSocket.connect('wss://$serverUrl', headers: headers)
          .then((WebSocket newSocket) {
        // WebSocket connection established
        print("connected");
        socket = newSocket;
        _onWebSocketConnected();
      }).catchError((error) {
        // Handle connection error
        print('WebSocket connection failed: $error');
      });
    } else {
      print('Authentication token not available yet. Please wait.');
    }
  }

  void _onWebSocketConnected() {
    // Listen for incoming messages from the server
    print("start listen");
    UpdateLiveStatecol("on");
    socket?.listen((message) {
      print('Received message: $message');
      try {
        // Parse the JSON message as a List of dynamic objects
        List<dynamic> dataList = json.decode(message);
        // print("this is: " + dataList.toString());
        // Loop through each object in the list
        for (var data in dataList) {
          // Access the specific value using its key
          setState(() {
            conversionRate =
                double.parse(data["conversionRate"].toStringAsFixed(3));

            if (data['symbol'] == "XAU/USD") {
              double temp;
              temp = data["bid"];
              currentGoldBID = temp.toStringAsFixed(2);
              // context.read<RateData>().changeData(cGB: temp.toString());
              currentGoldASK = (temp + 0.5).toStringAsFixed(2);

              DayhighG = (data["high"]).toStringAsFixed(2);
              DaylowG = (data["low"]).toStringAsFixed(2);
              GColStatus = data["goldStatus"];
            }

            if (data['symbol'] == "XAG/USD") {
              double temp;
              temp = data["bid"];
              currentSilverBID = temp.toStringAsFixed(2);
              currentSilverASK = (temp + 0.05).toStringAsFixed(2);
              DayHighS = (data["high"]).toStringAsFixed(2);
              DayLowS = (data["low"]).toStringAsFixed(2);

              SColStatus = data["silverStatus"];
            }
          });
        }
      } catch (e) {
        print('Error parsing JSON: $e');
      }
    }, onError: (error) {
      print('WebSocket error: $error');
    }, onDone: () {
      UpdateLiveStatecol("off");
      generateAuthToken();

      print('WebSocket connection closed');
    });
  }

  void UpdateLiveStatecol(String state) {
    setState(() {
      if (state == "on") {
        livecol = Colors.red;
      } else {
        livecol = Colors.grey;
      }
    });
  }

  int pageindex = 2;
  final Livechart _livechart = Livechart();
  final Product _product = new Product();
  final Conatct _conatct = new Conatct();
  final AboutPage _aboutPage = new AboutPage();
  final Alert _alert = new Alert();
  final WhatsappLaunch _whatsappLaunch = new WhatsappLaunch();

  Widget _showPage = new Livechart();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _aboutPage;
      case 1:
        return _product;
      case 2:
        return _livechart;
      case 3:
        return _whatsappLaunch;
      case 4:
        return _conatct;
      case 5:
        return _alert;
      default:
        return new Container(
          child: Center(
            child: Text("No [Page]"),
          ),
        );
    }
  }

  @override
  void initState() {
    if (widget.val != 5) {
      generateAuthToken();
    } else {
      print("channel already open");
    }

    if (widget.val == 5) {
      _showPage = _pageChooser(widget.val);
    }

    super.initState();

    Noti.initialize(flutterLocalNotificationsPlugin);

    if (widget.State1 == true) {
      Timer(
          Duration(milliseconds: 500),
          () => Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                return const _AddTodoPopupCard();
              })));

      Timer(Duration(milliseconds: 2500), () => Navigator.of(context).pop());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/barBG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: _showPage,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: CurvedNavigationBar(
            height: 70.h,
            color: Colors.white12,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 300),
            onTap: (int index) {
              setState(() {
                print(index);
                if (index == 2 && _showPage == _alert) {
                  _showPage = _pageChooser(2);
                } else {
                  _showPage = _pageChooser(index);
                }
              });
            },
            index: pageindex,
            items: [
              LayoutBuilder(builder: (context, constraints) {
                return SvgPicture.asset(
                  "assets/images/user.svg",
                  semanticsLabel: "ss",
                  width: MediaQuery.of(context).size.width * 0.07,
                );
              }),
              LayoutBuilder(builder: (context, constraints) {
                return SvgPicture.asset(
                  "assets/images/store.svg",
                  semanticsLabel: "ss",
                  width: MediaQuery.of(context).size.width * 0.07,
                );
              }),
              Image.asset("assets/images/logo.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    return SvgPicture.asset(
                      "assets/images/WhatsAppLogo.svg",
                      semanticsLabel: "sse",
                      width: MediaQuery.of(context).size.width * 0.08,
                    );
                  }),
                ],
              ),
              LayoutBuilder(builder: (context, constraints) {
                return SvgPicture.asset(
                  "assets/images/phone.svg",
                  semanticsLabel: "ss",
                  width: MediaQuery.of(context).size.width * 0.07,
                );
              }),
            ]),
      ),
    );
  }
}

class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key? key}) : super(key: key);
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0.h, horizontal: 22.0.w),
          child: Hero(
            tag: heroAddTodo,
            child: Material(
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0.r)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: goldtheme,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0.r))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 05.0.h, horizontal: 20.0.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Text(
                                "ENRICH Welcomes You!",
                                style: TextStyle(
                                    color: goldtheme,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp),
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "INVEST IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp),
                                  ),
                                  Text(
                                    " GOLD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 05.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "SECURE YOUR FUTURE!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
