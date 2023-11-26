import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var vertpadding = 10.h;
final Uri web = Uri.parse("https://enrichgoldjewels.com/");
final Uri whatsapp = Uri.parse("https://wa.me/923222321683");
const blacktheme = Color.fromRGBO(18, 18, 18, 1);
const blackthemelite = Color.fromRGBO(47, 45, 43, 0.8);
const goldtheme = Color(0xFFEDD185);
const silverTheme = Color.fromARGB(255, 202, 202, 202);
const silverThemelite = Color.fromARGB(168, 202, 202, 202);

const goldthemelite = Color.fromRGBO(237, 209, 133, 0.8);
const goldthemelitetxt = Color.fromRGBO(237, 209, 133, 0.6);

const goldGradient = LinearGradient(
    begin: Alignment(-0.9755386710166931, 0.1441882848739624),
    end: Alignment(-0.007879379205405712, -0.008102284744381905),
    colors: [
      Color.fromRGBO(232, 189, 112, 1),
      Color.fromRGBO(237, 209, 133, 1),
    ]);
const glassmorph = LinearGradient(
    begin: Alignment(-0.3, 0.8),
    end: Alignment(0.3, -0.1),
    colors: [
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(255, 255, 255, 0.17),
    ]);
const silverGradient = LinearGradient(
    begin: Alignment(-0.9755386710166931, 0.1441882848739624),
    end: Alignment(-0.007879379205405712, -0.008102284744381905),
    colors: [
      Color.fromRGBO(167, 166, 166, 1),
      Color.fromRGBO(202, 202, 202, 1)
    ]);

const headerflex = 6;
const bodyflex = 30;
const Navflex = 5;

const String heroAddTodo = 'add-todo-hero';
var currentGoldBID = "0000";
var currentGoldASK = "0000";
var currentSilverASK = "0000";
var currentSilverBID = "0000";
var DayLowS = "0000";
var DayHighS = "0000";
var DayhighG = "0000";
var DaylowG = "0000";
var GColStatus = "0";
var SColStatus = "0";

var conversionRate = 0.0;

var livecol = Colors.grey;
var green = Colors.green;
