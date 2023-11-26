import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gold_application_project/constant.dart';

import 'header.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertpadding, horizontal: 22.w),
      child: Column(
        children: [
          Expanded(
              flex: headerflex,
              child: Header(
                Headertxt: "PRODUCT",
              )),
          Expanded(
              flex: bodyflex,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 18.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD KILO BAR",
                      puritybar: "995.0",
                      weightbar: "1 KILOGRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/1CastG995.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD KILO BAR",
                      puritybar: "999.9",
                      weightbar: "1 KILOGRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/1CastG999.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD CAST BAR (500g)",
                      puritybar: "995.0",
                      weightbar: "500 GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/500Cast995.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD CAST BAR (500g)",
                      puritybar: "999.9",
                      weightbar: "500 GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/500CastG999.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: goldGradient,
                      textbar: "TEN TOLA GOLD BAR",
                      puritybar: "999.9",
                      weightbar: "TEN TOLA",
                      colorbar: goldtheme,
                      imagebar: "assets/images/ttBar.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 15.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD GRAINS",
                      puritybar: "995.0",
                      weightbar: "MULTI GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/goldGrains.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 15.sp,
                      gradientbar: goldGradient,
                      textbar: "LARGE GOLD BAR",
                      puritybar: "999.9",
                      weightbar: "MULTI GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/largeBar.png",
                    ),
                    ProductInfo(
                      leftP: 15.0,
                      fontbar: 15.sp,
                      gradientbar: goldGradient,
                      textbar: "GOLD INVESTMENT BAR",
                      puritybar: "999.9",
                      weightbar: "MULTI GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/groupgoldbars.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: silverGradient,
                      textbar: "SILVER KILO BAR",
                      puritybar: "PURE",
                      weightbar: "1 KILOGRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/1CastS.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: silverGradient,
                      textbar: "SILVER CAST BAR (500g)",
                      puritybar: "PURE",
                      weightbar: "500 GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/500CastSilver.png",
                    ),
                    ProductInfo(
                      leftP: 15.0,
                      fontbar: 15.sp,
                      gradientbar: silverGradient,
                      textbar: "SILVER INVESTMENT BAR",
                      puritybar: "PURE",
                      weightbar: "MULTI GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/groupsilverbars.png",
                    ),
                    ProductInfo(
                      leftP: 0.0,
                      fontbar: 16.sp,
                      gradientbar: silverGradient,
                      textbar: "SILVER GRAINS",
                      puritybar: "PURE",
                      weightbar: "MULTI GRAM",
                      colorbar: goldtheme,
                      imagebar: "assets/images/SilverGrain1.png",
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  ProductInfo(
      {super.key,
      required this.fontbar,
      required this.imagebar,
      required this.gradientbar,
      required this.textbar,
      required this.weightbar,
      required this.puritybar,
      required this.leftP,
      required this.colorbar});

  final imagebar, colorbar, textbar, puritybar, weightbar, gradientbar, fontbar;
  final double leftP;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 0.w),
              height: 113.h,
              decoration: BoxDecoration(
                  gradient: gradientbar,
                  borderRadius: BorderRadius.all(Radius.circular(11.r))),
              child: Padding(
                  padding: EdgeInsets.only(left: leftP),
                  child: Image.asset(
                    imagebar,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Container(
                  height: 113.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: blackthemelite,
                      border: Border.all(color: goldtheme),
                      borderRadius: BorderRadius.all(Radius.circular(11.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textbar,
                        style: TextStyle(
                            fontSize: fontbar,
                            fontFamily: 'Montserrat',
                            color: colorbar),
                      ),
                      Container(
                        width: 60.w,
                        decoration:
                            BoxDecoration(border: Border.all(color: colorbar)),
                      ),
                      Row(
                        children: [
                          Text(
                            "PURITY:",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(puritybar,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  color: colorbar))
                        ],
                      ),
                      Row(
                        children: [
                          Text("WEIGHT:",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(weightbar,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  color: colorbar))
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
