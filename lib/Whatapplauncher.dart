import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'constant.dart';
import 'main.dart';

class WhatsappLaunch extends StatefulWidget {
  const WhatsappLaunch({super.key});

  @override
  State<WhatsappLaunch> createState() => _WhatsappLaunchState();
}

class _WhatsappLaunchState extends State<WhatsappLaunch> {
  void openWhatsApp() async {
    String ANDurl = "whatsapp://send?phone=" + "971504569709";

    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(ANDurl))) {
        await launchUrl(Uri.parse(ANDurl),
            mode: LaunchMode.externalApplication);
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(
              val: 2,
              State1: false,
            ),
          ),
        );
      } else {
        // Display a Snackbar if neither WhatsApp nor web page can be launched
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: goldtheme,
            content: Text(
              'Android: WhatsApp not installed',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      }
    } else if (Platform.isIOS) {}
  }

  @override
  void initState() {
    openWhatsApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
