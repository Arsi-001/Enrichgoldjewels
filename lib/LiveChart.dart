import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gold_application_project/UserProvider.dart';
import 'package:gold_application_project/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'header.dart';

// ignore: must_be_immutable
class Livechart extends StatefulWidget {
  Livechart({
    super.key,
  });

  @override
  State<Livechart> createState() => _LivechartState();
}

class _LivechartState extends State<Livechart>
    with SingleTickerProviderStateMixin {
  bool isGold = true;
  Color goldbutton = goldtheme;
  Color silverbutton = blacktheme;
  Color goldbuttontxt = blacktheme;
  Color silverbuttontxt = silverTheme;
  Color GCol = Colors.black;

  Color SCol = Colors.black;
  late AnimationController _animationController;
  CarouselController buttonCarouselController = CarouselController();
  bool silverbutt = true;
  bool goldbutt = false;

  Future<void> changeRateStateCol(String Gstatus, String Sstatus) async {
    if (Gstatus == "-1") {
      GCol = Colors.red;
    } else if (Gstatus == "1") {
      GCol = Colors.green;
    }

    if (Sstatus == "-1") {
      SCol = Colors.red;
    } else if (Sstatus == "1") {
      SCol = Colors.green;
    }
    Future.delayed(Duration(milliseconds: 500), () {
      GCol = Colors.black;
      SCol = Colors.black;
    });
  }

  void changebuttstate(index) {
    if (index == 0) {
      goldbutton = goldtheme;
      silverbutton = blacktheme;
      goldbuttontxt = blacktheme;
      silverbuttontxt = silverTheme;
      silverbutt = true;
    } else {
      goldbutton = blacktheme;
      silverbutton = silverTheme;
      goldbuttontxt = goldtheme;
      silverbuttontxt = blacktheme;
      goldbutt = true;
    }
  }

  late Timer _dataUpdateTimer;

  @override
  void initState() {
    super.initState();
    _dataUpdateTimer = Timer.periodic(Duration(milliseconds: 1100), (timer) {
      setState(() {});
      changeRateStateCol(GColStatus, SColStatus);
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _dataUpdateTimer.cancel();

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertpadding, horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: headerflex,
            child: Header(
              Headertxt: "SPOT RATE",
            ),
          ),
          Expanded(
            flex: bodyflex,
            child: Container(
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    items: [
                      Column(
                        children: [
                          BigBubble(
                            dayHigh: DayhighG,
                            dayLow: DaylowG,
                            txtCol: GCol,
                            Gradient: goldGradient,
                            askratetxt: currentGoldASK,
                            bidratetxt: currentGoldBID,
                            imagetxt: 'assets/images/Gmain.png',
                            bubbletxt: "GOLD",
                            coltheme: goldtheme,
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => {
                                  setState(() {
                                    if (goldbutt == true) {
                                      buttonCarouselController.previousPage(
                                          duration:
                                              Duration(milliseconds: 300));
                                    }
                                    ;
                                    isGold = true;
                                    silverbutt = true;
                                    goldbutt = false;
                                    goldbutton = goldtheme;
                                    goldbuttontxt = blacktheme;
                                    silverbuttontxt = silverTheme;
                                    silverbutton = blacktheme;
                                  }),
                                  print("TAP"),
                                  //print(isGold),
                                  print(
                                      "\n\n\n\n THIS IS RATE :::: $conversionRate"),
                                  print(silverbutt),
                                  print(goldbutt),
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: goldbutton,
                                            border:
                                                Border.all(color: goldtheme),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.r))),
                                        child: Center(
                                          child: Text(
                                            'GOLD',
                                            style: TextStyle(
                                                color: goldbuttontxt,
                                                fontSize: 15.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: GestureDetector(
                                          onTap: () => {
                                            setState(() {
                                              if (silverbutt == true) {
                                                buttonCarouselController
                                                    .nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300));
                                              }
                                              ;
                                              isGold = false;
                                              silverbutt = false;
                                              goldbutt = true;
                                              goldbutton = blacktheme;
                                              goldbuttontxt = goldtheme;
                                              silverbuttontxt = blacktheme;
                                              silverbutton = silverTheme;
                                            }),
                                            print("TAP"),
                                            print(isGold)
                                          },
                                          child: Container(
                                              width: 80.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                  color: silverbutton,
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              192,
                                                              192,
                                                              192,
                                                              1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              32.r))),
                                              child: Center(
                                                child: Text(
                                                  'SILVER',
                                                  style: TextStyle(
                                                      color: silverbuttontxt,
                                                      fontSize: 15.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 390.h,
                            child: SingleChildScrollView(
                              child: Column(
                                key: ValueKey('Gold'),
                                children: [
                                  listgoldinfobubble(
                                    barCol: GCol,
                                    heading: "GOLD BAR (.995)",
                                    Weighttxt: "1-KILOGRAM",
                                    barVal: (1 *
                                            995 /
                                            31.1035 *
                                            (double.parse(currentGoldASK) +
                                                10) *
                                            conversionRate)
                                        .toStringAsFixed(0),
                                    imagetxt: "assets/images/1CastG995.png",
                                    colorsch: goldGradient,
                                  ),
                                  listgoldinfobubble(
                                    barCol: GCol,
                                    heading: "GOLD BAR (999.9)",
                                    Weighttxt: "1-KILOGRAM",
                                    barVal: (1 *
                                            999 /
                                            31.1035 *
                                            (double.parse(currentGoldASK) +
                                                10) *
                                            3.673)
                                        .toStringAsFixed(0),
                                    imagetxt: "assets/images/1CastG999.png",
                                    colorsch: goldGradient,
                                  ),
                                  listgoldinfobubble(
                                    barCol: GCol,
                                    heading: "GOLD (999.9)",
                                    Weighttxt: "1-TTB",
                                    barVal: (116.64 /
                                            31.1035 *
                                            (double.parse(currentGoldASK) +
                                                10) *
                                            conversionRate)
                                        .toStringAsFixed(0),
                                    imagetxt: "assets/images/1CastG995.png",
                                    colorsch: goldGradient,
                                  ),
                                  listgoldinfobubble(
                                    barCol: GCol,
                                    heading: "GOLD (24K)",
                                    barVal: (1 /
                                            31.1035 *
                                            (double.parse(currentGoldASK) +
                                                10) *
                                            conversionRate)
                                        .toStringAsFixed(0),
                                    Weighttxt: "1-GRAM",
                                    imagetxt: "assets/images/1CastG999.png",
                                    colorsch: goldGradient,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        key: ValueKey('Silver'),
                        children: [
                          BigBubble(
                            dayHigh: DayHighS,
                            dayLow: DayLowS,
                            txtCol: SCol,
                            Gradient: silverGradient,
                            askratetxt: currentSilverASK,
                            bidratetxt: currentSilverBID,
                            imagetxt: 'assets/images/Smain.png',
                            bubbletxt: "SILVER",
                            coltheme: silverTheme,
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => {
                                  setState(() {
                                    if (goldbutt == true) {
                                      buttonCarouselController.previousPage(
                                          duration:
                                              Duration(milliseconds: 300));
                                    }
                                    ;
                                    isGold = true;
                                    silverbutt = true;
                                    goldbutt = false;
                                    goldbutton = goldtheme;
                                    goldbuttontxt = blacktheme;
                                    silverbuttontxt = silverTheme;
                                    silverbutton = blacktheme;
                                  }),
                                  print("TAP"),
                                  //print(isGold),
                                  print(
                                      "\n\n\n\n THIS IS RATE :::: $conversionRate"),
                                  print(silverbutt),
                                  print(goldbutt),
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: goldbutton,
                                            border:
                                                Border.all(color: goldtheme),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.r))),
                                        child: Center(
                                          child: Text(
                                            'GOLD',
                                            style: TextStyle(
                                                color: goldbuttontxt,
                                                fontSize: 15.sp,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: GestureDetector(
                                          onTap: () => {
                                            setState(() {
                                              if (silverbutt == true) {
                                                buttonCarouselController
                                                    .nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300));
                                              }
                                              ;
                                              isGold = false;
                                              silverbutt = false;
                                              goldbutt = true;
                                              goldbutton = blacktheme;
                                              goldbuttontxt = goldtheme;
                                              silverbuttontxt = blacktheme;
                                              silverbutton = silverTheme;
                                            }),
                                            print("TAP"),
                                            print(isGold)
                                          },
                                          child: Container(
                                              width: 80.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                  color: silverbutton,
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              192,
                                                              192,
                                                              192,
                                                              1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              32.r))),
                                              child: Center(
                                                child: Text(
                                                  'SILVER',
                                                  style: TextStyle(
                                                      color: silverbuttontxt,
                                                      fontSize: 15.sp,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          listgoldinfobubble(
                            barCol: SCol,
                            barVal: ((1000 / 31.1035) *
                                    (double.parse(currentSilverASK) + 10) *
                                    conversionRate)
                                .toStringAsFixed(0),
                            heading: "SILVER BAR (PURE)",
                            Weighttxt: "1-KILOGRAM",
                            imagetxt: "assets/images/1CastS.png",
                            colorsch: silverGradient,
                          ),
                          listgoldinfobubble(
                            barCol: SCol,
                            barVal: (((1000 / 31.1035) *
                                        (double.parse(currentSilverASK) + 10) *
                                        conversionRate) /
                                    1000)
                                .toStringAsFixed(2),
                            heading: "SILVER (PURE)",
                            Weighttxt: "1-GRAM",
                            imagetxt: "assets/images/1CastS.png",
                            colorsch: silverGradient,
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                        onPageChanged: ((index, reason) => {
                              setState(() {
                                changebuttstate(index);
                              })
                            }),
                        enlargeCenterPage: true,
                        pauseAutoPlayOnTouch: true,
                        height: 695.h,
                        autoPlayCurve: Curves.bounceIn,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        reverse: false,
                        autoPlay: false,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayInterval: Duration(seconds: 3)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BigBubble extends StatelessWidget {
  const BigBubble({
    super.key,
    required this.Gradient,
    required this.bidratetxt,
    required this.askratetxt,
    required this.imagetxt,
    required this.bubbletxt,
    required this.coltheme,
    required this.dayHigh,
    required this.txtCol,
    required this.dayLow,
  });

  final Gradient,
      bidratetxt,
      txtCol,
      bubbletxt,
      imagetxt,
      askratetxt,
      coltheme,
      dayLow,
      dayHigh;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33.r), gradient: Gradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Icon(
                      Icons.circle,
                      color: livecol,
                      size: 13,
                    ),
                  ],
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "Current Ask",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: 05.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$" + "$askratetxt",
                      // context.watch<RateData>().currentBIDgold,
                      style: TextStyle(
                          color: txtCol,
                          fontSize: 36.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 18.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(31.r))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(bubbletxt,
                              style: TextStyle(
                                  color: coltheme,
                                  fontSize: 12.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 05.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text("LOW",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700)),
                                Icon(
                                  UniconsLine.arrow_down,
                                  color: Colors.red,
                                  size: 18,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("\$" + "$dayLow",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 18.w,
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text("HIGH",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700)),
                                Icon(
                                  UniconsLine.arrow_up,
                                  color: Colors.green,
                                  size: 18,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("\$" + "$dayHigh",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 18.w,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        height: 110.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.r))),
                        child: Image.asset(
                          imagetxt,
                          //  'assets/images/goldbar.png',
                          fit: BoxFit.fitHeight,
                        ))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 05.h,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 375.w,
                height: 1.h,
                color: Colors.black,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text("Current Bid: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600)),
                    Text("\$" + "$bidratetxt",
                        style: TextStyle(
                            color: txtCol,
                            fontSize: 20.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class listgoldinfobubble extends StatelessWidget {
  const listgoldinfobubble(
      {super.key,
      required this.heading,
      required this.imagetxt,
      required this.Weighttxt,
      required this.barVal,
      required this.barCol,
      required this.colorsch});

  final colorsch;
  final barCol;
  final Weighttxt;
  final imagetxt;
  final heading;
  final barVal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0.h),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11.r)),
            gradient: colorsch),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 80.h,
                    height: 50.w,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(35.r))),
                    child: Image.asset(
                      imagetxt,
                      fit: BoxFit.contain,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      heading,
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      Weighttxt,
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.60),
                          fontSize: 15.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "AED",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    barVal.replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: barCol,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
