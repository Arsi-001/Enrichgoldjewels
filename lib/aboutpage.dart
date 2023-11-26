import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_application_project/constant.dart';
import 'package:gold_application_project/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertpadding, horizontal: 22.w),
      child: Column(
        children: [
          Expanded(
            flex: headerflex,
            child: Header(
              Headertxt: "ABOUT US",
            ),
          ),
          Expanded(
              flex: bodyflex,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "ENRICH",
                          style: TextStyle(
                            height: 1.5.h,
                            letterSpacing: 2,
                            color: Color(0xFFFBD263),
                            fontFamily: 'Montserrat',

                            fontSize: 28.sp,
                            //fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          "GOLD & JEWELS",
                          style: TextStyle(
                            height: 1.5.h,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 24.sp,
                            //fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "At ENRICH,  we are a leading bullion gold trading company dedicated to providing our clients with exceptional services in the precious metals market. With years of experience and a commitment to integrity, we offer a trusted platform for individuals and institutions to buy and sell gold bullion.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5.h,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Our primary focus is on facilitating the buying and selling of gold bullion, providing individuals and institutions with a secure and transparent platform to engage in these transactions. We understand the significance of gold as a timeless store of value and a hedge against economic uncertainties. Therefore, we strive to create a seamless trading experience that ensures the utmost convenience and trust for our clients.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5.h,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                                border:
                                    Border(top: BorderSide(color: goldtheme))),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
