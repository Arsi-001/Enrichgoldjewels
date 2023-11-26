import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_application_project/Contact.dart';
import 'package:gold_application_project/constant.dart';
import 'package:gold_application_project/header.dart';

import 'noti.dart';

class Alert extends StatefulWidget {
  Alert({
    super.key,
  });

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  late Timer _dataUpdateTimer;
  @override
  void initState() {
    super.initState();
    _dataUpdateTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    print("SHOULD BE");
  }

  @override
  void dispose() {
    _dataUpdateTimer.cancel();

    super.dispose();
  }

  TextEditingController Goldalert = new TextEditingController();
  TextEditingController Silveralert = new TextEditingController();
  var Goldval = "No Alert";
  var Silverval = "No Alert";
  bool goldAlertS = false;
  bool silverAlertS = false;

  void UpdateVal(whatisit) {
    setState(() {
      if (whatisit == "GOLD BID/ASK:   ") {
        Goldval = "No Alert";
        goldAlertS = false;
        print(Goldval);
      } else if (whatisit == "SILVER BID/ASK: ") {
        Silverval = "No Alert";
        silverAlertS = false;
      }
    });
  }

  void setAlert(double val, String which, String what) {
    if (what == "gold") {
      if (which == "BID - Greater or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentGoldBID) >= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of BID at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");

            timer.cancel();
          }
        });
      } else if (which == "ASK - Greater or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentGoldASK) >= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      } else if (which == "BID - Lesser or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentGoldBID) <= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      } else if (which == "ASK - Lesser or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentGoldASK) <= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      }
    } else if (what == "silver") {
      if (which == "BID") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentSilverBID) >= val) {
            Noti.showBigTextNotification(
                title: "SILVER ALERT FOUND!",
                body: "Current value of BID at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("SILVER BID/ASK: ");
            timer.cancel();
          }
        });
      } else if (which == "ASK - Greater or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentSilverASK) >= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      } else if (which == "BID - Lesser or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentSilverBID) <= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      } else if (which == "ASK - Lesser or Equal") {
        Timer.periodic(Duration(seconds: 1), (timer) {
          if (double.parse(currentSilverASK) <= val) {
            Noti.showBigTextNotification(
                title: "GOLD ALERT FOUND!",
                body: "Current value of ASK at set value: $val",
                fln: flutterLocalNotificationsPlugin);
            UpdateVal("GOLD BID/ASK:   ");
            timer.cancel();
          }
        });
      }
    }
  }

  void updateValue(String newValue, String whatisit, String whichisit) {
    setState(() {
      if (whatisit == "CURRENT GOLD BID/ASK") {
        Goldval = newValue;
        goldAlertS = true;
        setAlert(double.parse(newValue), whichisit, "gold");
        print("this gold: " + Goldval);
      } else if (whatisit == "CURRENT SILVER BID/ASK") {
        Silverval = newValue;
        silverAlertS = true;
        setAlert(double.parse(newValue), whichisit, "silver");
        print("this silver:" + newValue);

        print(whatisit);
      }
    });
    // Do whatever you need with the updated value
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertpadding),
      child: SingleChildScrollView(
        primary: false,
        physics: ClampingScrollPhysics(),
        child: Container(
          height: 840.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: headerflex,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0.h),
                  child: Header(
                    Headertxt: "RATE ALERT",
                  ),
                ),
              ),
              Expanded(
                flex: bodyflex,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    alertsetter(
                      callback: updateValue,
                      alertCont: Goldalert,
                      colorth: goldthemelite,
                      colorGra: goldGradient,
                      txtOftitle: "CURRENT GOLD BID/ASK",
                      txtOfbidval: currentGoldBID,
                      txtOfaskval: currentGoldASK,
                    ),
                    Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: goldtheme))),
                    ),
                    alertsetter(
                      txtOfaskval: currentSilverASK,
                      callback: updateValue,
                      alertCont: Silveralert,
                      colorth: silverThemelite,
                      colorGra: silverGradient,
                      txtOftitle: "CURRENT SILVER BID/ASK",
                      txtOfbidval: currentSilverBID,
                    ),
                    Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: goldtheme))),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        "CURRENT ALERTS",
                        style: TextStyle(
                            color: goldtheme,
                            fontFamily: 'Montserrat',
                            fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0.h),
                      child: Container(
                        height: 135.h,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            border: Border.all(color: goldtheme),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            viewAlertRow(
                              callback: UpdateVal,
                              buttonS: goldAlertS,
                              txtoftitle: "GOLD BID/ASK:   ",
                              txtofvalue: Goldval,
                              colth: goldtheme,
                            ),
                            viewAlertRow(
                              callback: UpdateVal,
                              buttonS: silverAlertS,
                              txtoftitle: "SILVER BID/ASK: ",
                              txtofvalue: Silverval,
                              colth: silverTheme,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class viewAlertRow extends StatefulWidget {
  viewAlertRow({
    super.key,
    required this.colth,
    required this.txtoftitle,
    required this.txtofvalue,
    required this.buttonS,
    required this.callback,
  });
  final Function(String) callback;
  final colth, txtoftitle;
  var txtofvalue;
  var buttonS;

  @override
  State<viewAlertRow> createState() => _viewAlertRowState();
}

class _viewAlertRowState extends State<viewAlertRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.txtoftitle,
                  style: TextStyle(
                      color: widget.colth, fontFamily: 'Lato', fontSize: 18.sp),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  widget.txtofvalue,
                  style: TextStyle(
                      color: const Color.fromARGB(177, 255, 255, 255),
                      fontFamily: 'Montserrat',
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                height: 30.h,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    elevation: 6,
                    backgroundColor: Color.fromARGB(255, 255, 47, 0),
                    disabledBackgroundColor: Color.fromARGB(65, 255, 47, 0),
                    disabledForegroundColor: Color.fromARGB(126, 255, 47, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: widget.buttonS
                      ? () => {
                            setState(() {
                              widget.callback(widget.txtoftitle);
                            }),
                          }
                      : null,
                  child: Text("DELETE",
                      maxLines: 1,
                      style: TextStyle(
                        color: Color.fromARGB(193, 255, 255, 255),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      )),
                )),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class alertsetter extends StatefulWidget {
  alertsetter({
    super.key,
    required this.alertCont,
    required this.txtOftitle,
    required this.txtOfbidval,
    required this.colorth,
    required this.colorGra,
    required this.callback,
    required this.txtOfaskval,
  });
  final Function(String, String, String) callback;
  final txtOftitle, txtOfbidval, colorth, colorGra, txtOfaskval;
  TextEditingController alertCont;

  @override
  State<alertsetter> createState() => _alertsetterState();
}

class _alertsetterState extends State<alertsetter> {
  final _formKey = GlobalKey<FormState>();
  String ddval = "Select";
  String CState = "";
  void CurrentState(State) {
    setState(() {
      CState = State;
      ddval = State;
      print("NEWSTATE: " + CState);
    });
  }

  List<String> items = [
    "Select",
    "BID - Greater or Equal",
    "ASK - Greater or Equal",
    "BID - Lesser or Equal",
    "ASK - Lesser or Equal"
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.txtOftitle,
              style: TextStyle(
                  color: widget.colorth,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "BID",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            widget.txtOfbidval,
                            style: TextStyle(
                                color: widget.colorth,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Column(
                        children: [
                          Text(
                            "ASK",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            widget.txtOfaskval,
                            style: TextStyle(
                                color: widget.colorth,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CrudinfoDropdown(
                      callback: CurrentState,
                      contentTheme: widget.colorth,
                      W: 0.0.w,
                      H: 50.0.h,
                      colth: Colors.black54,
                      itemsc: items,
                      dropdownvalue: ddval),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CrudinfoTextfield(
                        txtinput:
                            TextInputType.numberWithOptions(decimal: true),
                        format: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            final text = newValue.text;
                            return text.isEmpty
                                ? newValue
                                : double.tryParse(text) == null
                                    ? oldValue
                                    : newValue;
                          }),
                        ],
                        keyform: _formKey,
                        vertpad: 0.h,
                        H: 65.h,
                        hinttxt: "Enter Value",
                        colth: widget.colorth,
                        TextEditCont: widget.alertCont,
                        maxline: 1),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: widget.colorGra,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      height: 60.h,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              if (widget.alertCont.text != "") {
                                // String Newval = widget.alertCont.text;
                                // widget.alertCont.clear();
                                // print(Newval);
                                // widget.callback(Newval, widget.txtOftitle);

                                if (CState == "BID - Greater or Equal" ||
                                    CState == "ASK - Greater or Equal" ||
                                    CState == "BID - Lesser or Equal" ||
                                    CState == "ASK - Lesser or Equal") {
                                  String Newval = widget.alertCont.text;
                                  widget.alertCont.clear();
                                  print(Newval);
                                  widget.callback(
                                      Newval, widget.txtOftitle, CState);
                                  Noti.showBigTextNotification(
                                      title: "ALERT SET",
                                      body:
                                          "you have set an alert for $CState at value: $Newval",
                                      fln: flutterLocalNotificationsPlugin);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: goldtheme,
                                      content: Text(
                                        'Select Bid or Ask First!',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: goldtheme,
                                    content: Text(
                                      'Enter Value',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                );
                              }
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3, //elevation of button
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),

                          // Use the Container to apply the gradient as the background
                          // You can also adjust other properties such as padding, borderRadius, etc.
                          backgroundColor: Colors.transparent,

                          padding: EdgeInsets.symmetric(
                              vertical: 0.h, horizontal: 0.w),
                        ),
                        child: Text(
                          "Set Alert",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CrudinfoDropdown extends StatefulWidget {
  CrudinfoDropdown({
    super.key,
    required this.W,
    required this.H,
    required this.callback,
    required this.colth,
    required this.itemsc,
    required this.dropdownvalue,
    required this.contentTheme,
  });
  final W, H, colth, contentTheme;
  final Function(String) callback;
  var dropdownvalue;
  List<String> itemsc;

  @override
  State<CrudinfoDropdown> createState() => _CrudinfoDropdownState();
}

class _CrudinfoDropdownState extends State<CrudinfoDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Container(
        height: widget.H,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
            color: widget.colth,
            border: Border.all(color: widget.contentTheme, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            // Initial Value
            isExpanded: true,
            dropdownColor: Colors.black87,
            alignment: Alignment.centerLeft,
            value: widget.dropdownvalue,
            style: TextStyle(),

            borderRadius: BorderRadius.all(Radius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 8.w),

            // Down Arrow Icon
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: widget.contentTheme,
            ),

            // Array list of items
            items: widget.itemsc.map((String items) {
              return DropdownMenuItem(
                alignment: Alignment.center,
                value: items,
                child: Text(
                  items,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.contentTheme,
                      overflow: TextOverflow.clip,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                print(newValue);
                widget.dropdownvalue = newValue!;
                widget.callback(newValue.toString());
              });
            },
          ),
        ),
      ),
    );
  }
}
