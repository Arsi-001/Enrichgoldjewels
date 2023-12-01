import 'package:flutter/material.dart';

class RateData extends ChangeNotifier {
  String currentBIDgold;
  // String currentASKgold;
  // String currentASKsilver;
  // String currentBIDsilver;
  // String dayLowgold;
  // String dayHighgold;
  // String dayLowsilver;
  // String dayHighsilver;
  // String goldStatus;
  // String silverStatus;

  RateData({
    this.currentBIDgold = "0000",
    // this.currentASKgold = "0000",
    // this.currentASKsilver = "0000",
    // this.currentBIDsilver = "0000",
    // this.dayLowgold = "0000",
    // this.dayHighgold = "0000",
    // this.dayLowsilver = "0000",
    // this.dayHighsilver = "0000",
    // this.goldStatus = "0",
    // this.silverStatus = "0",
  });

  void changeData({
    required cGB,
    // required cGA,
    // required cSB,
    // required cSA,
    // required dGH,
    // required dGL,
    // required dSH,
    // required dSL,
    // required gS,
    // required sS,
  }) async {
    cGB = currentBIDgold;
    // cGA = currentASKgold;
    // cSB = currentBIDsilver;
    // cSA = currentASKsilver;
    // dGH = dayHighgold;
    // dGL = dayLowgold;
    // dSH = dayHighsilver;
    // dSL = dayLowsilver;
    // gS = goldStatus;
    // sS = silverStatus;
    notifyListeners();
  }
}
