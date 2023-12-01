import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold_application_project/constant.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'header.dart';

class Conatct extends StatefulWidget {
  const Conatct({super.key});

  @override
  State<Conatct> createState() => _ConatctState();
}

class _ConatctState extends State<Conatct> {
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  TextEditingController email = new TextEditingController();
  TextEditingController message = new TextEditingController();
  String FullName = "";
  String Email = "";
  String Message = "";

  void LaunchDialer(String phonenumber) async {
    var tel = "tel:$phonenumber";

    await launchUrl(Uri.parse(tel), mode: LaunchMode.externalApplication);
  }

  void LaunchSocials(String S) async {
    //https://instagram.com/enrichgoldandjewels?igshid=OGQ5ZDc2ODk2ZA==
    if (S == "Facebook") {
      await launchUrl(Uri.parse(
          "https://www.facebook.com/enrichgoldjewels?mibextid=ZbWKwL"));
    } else if (S == "Instagram") {
      await launchUrl(Uri.parse(
          "https://instagram.com/enrichgoldandjewels?igshid=OGQ5ZDc2ODk2ZA=="));
    } else if (S == "Youtube") {
      await launchUrl(
          Uri.parse("https://www.youtube.com/@EnrichGoldAndJewels/featured"));
    } else if (S == "Website") {
      await launchUrl(Uri.parse("https://www.enrichgoldjewels.com"));
    } else if (S == "Address") {
      await launchUrl(Uri.parse(
          "https://www.google.com/maps/place/201+-+3+Gold+Souq+-+Deira+-+Al+Ras+-+Dubai+-+United+Arab+Emirates/@25.2706298,55.2934663,17z/data=!3m1!4b1!4m9!1m2!2m1!1sDalmook+Bldg.+Office+%23+201,+Gold+Souq%5Cn+Gate+3,+Al+Ras+Deira,+Dubai+-+U.A.E!3m5!1s0x3e5f4344051db243:0x3cbff0f81db6f142!8m2!3d25.2706299!4d55.2983372!15sCktEYWxtb29rIEJsZGcuIE9mZmljZSAjIDIwMSwgR29sZCBTb3VxXG4gR2F0ZSAzLCBBbCBSYXMgRGVpcmEsIER1YmFpIC0gVS5BLkWSARBjb21wb3VuZF9zZWN0aW9u4AEA?entry=ttu"));
    }
  }

  void SendEmail(String fname, String eml, String mess) async {
    var urlemail =
        "mailto:info@enrichgoldjewels.com?subject=Query: $fname&body=$mess\n"
        "$fname-$eml,";
    await launchUrl(Uri.parse(urlemail));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertpadding, horizontal: 22.w),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          height: 840.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: headerflex,
                child: Header(
                  Headertxt: "CONTACT US",
                ),
              ),
              Expanded(
                  flex: bodyflex,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 15.w),
                              height: 140.h,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(129, 0, 0, 0),
                                  border: Border.all(color: goldtheme),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " Address :",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp),
                                      ),
                                      GestureDetector(
                                        onTap: () => LaunchSocials("Address"),
                                        child: Text(
                                          ' Dalmook Bldg. Office # 201, Gold Souq\n Gate 3, Al Ras Deira, Dubai - U.A.E',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              color: goldtheme,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "      Email : ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        "info@enrichgoldjewels.com",
                                        style: TextStyle(
                                            color: goldtheme,
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "Landline : ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.sp),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            LaunchDialer("+97142248886"),
                                        child: Text(
                                          "+971  4  224 8886",
                                          style: TextStyle(
                                              color: goldtheme,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 70.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(129, 0, 0, 0),
                                  border: Border.all(color: goldtheme),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.call,
                                      color: goldtheme,
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            LaunchDialer("+971506615808"),
                                        child: Text(
                                          "+971 50 661 5808",
                                          style: TextStyle(
                                              color: goldtheme,
                                              fontFamily: 'Montserrat',
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "10AM-8PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.sp),
                                  )
                                ],
                              ),
                            ),
                            CrudinfoTextfield(
                              txtinput: TextInputType.text,
                              format: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              keyform: _formKey,
                              vertpad: 5.h,
                              maxline: 1,
                              H: 65.h,
                              hinttxt: "Full Name",
                              colth: goldthemelitetxt,
                              TextEditCont: name,
                            ),
                            CrudinfoTextfield(
                              txtinput: TextInputType.number,
                              format: [FilteringTextInputFormatter.digitsOnly],
                              keyform: _formKey,
                              vertpad: 0.h,
                              maxline: 1,
                              H: 65.h,
                              hinttxt: "Phone",
                              colth: goldthemelitetxt,
                              TextEditCont: phone,
                            ),
                            CrudinfoTextfield(
                              txtinput: TextInputType.emailAddress,
                              format: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              keyform: _formKey,
                              vertpad: 0.h,
                              maxline: 1,
                              H: 65.h,
                              hinttxt: "Email",
                              colth: goldthemelitetxt,
                              TextEditCont: email,
                            ),
                            CrudinfoTextfield(
                              txtinput: TextInputType.text,
                              format: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              keyform: _formKey,
                              vertpad: 0.h,
                              maxline: 2,
                              H: 80.h,
                              hinttxt: "Message",
                              colth: goldthemelitetxt,
                              TextEditCont: message,
                            ),
                            ElevatedButton(
                              onPressed: () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    FullName = name.text,
                                    Email = email.text,
                                    Message = message.text,
                                    name.clear(),
                                    email.clear(),
                                    message.clear(),
                                    phone.clear(),
                                    SendEmail(FullName, Email, Message)
                                  }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(129, 0, 0,
                                      0), //background color of button
                                  side: BorderSide(
                                      width: 1,
                                      color:
                                          goldtheme), //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h,
                                      horizontal:
                                          20.h) //content padding inside button
                                  ),
                              child: Text(
                                "Send Message",
                                style: TextStyle(
                                    color: goldtheme,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SocialsBubble(
                                  Callback: LaunchSocials,
                                  Icontitletxt: "Facebook",
                                  Icontxt: UniconsLine.facebook_f,
                                ),
                                SocialsBubble(
                                  Callback: LaunchSocials,
                                  Icontitletxt: "Instagram",
                                  Icontxt: UniconsLine.instagram,
                                ),
                                SocialsBubble(
                                  Callback: LaunchSocials,
                                  Icontitletxt: "Youtube",
                                  Icontxt: UniconsLine.youtube,
                                ),
                                SocialsBubble(
                                  Callback: LaunchSocials,
                                  Icontitletxt: "Website",
                                  Icontxt: Icons.web,
                                ),
                                SocialsBubble(
                                  Callback: LaunchSocials,
                                  Icontitletxt: "Address",
                                  Icontxt: UniconsLine.map_marker,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "POWERED BY:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp),
                                ),
                                Text(
                                  " GENERATIONS",
                                  style: TextStyle(
                                      color: goldtheme,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                ),
                              ],
                            )
                          ]),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialsBubble extends StatelessWidget {
  final Function Callback;
  const SocialsBubble({
    required this.Icontxt,
    required this.Icontitletxt,
    required this.Callback,
    super.key,
  });
  final Icontxt, Icontitletxt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Callback(Icontitletxt),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
                color: Colors.black45,
                border: Border.all(color: goldtheme),
                borderRadius: BorderRadius.all(Radius.circular(50.r))),
            child: Center(
              child: Icon(
                Icontxt,
                color: goldtheme,
              ),
            ),
          ),
          SizedBox(
            height: 05.h,
          ),
          // Text(
          //   Icontitletxt,
          //   style: TextStyle(color: goldtheme, fontSize: 10.sp),
          // )
        ],
      ),
    );
  }
}

class CrudinfoTextfield extends StatelessWidget {
  CrudinfoTextfield(
      {super.key,
      required this.H,
      required this.hinttxt,
      required this.colth,
      required this.TextEditCont,
      required this.maxline,
      required this.format,
      required this.keyform,
      required this.txtinput,
      required this.vertpad});
  final TextEditCont,
      H,
      format,
      hinttxt,
      colth,
      maxline,
      keyform,
      vertpad,
      txtinput;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: H,
      decoration: BoxDecoration(
          color: blackthemelite,
          border: Border.all(color: colth, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Center(
        child: TextFormField(
          keyboardType: txtinput,
          inputFormatters: format,
          maxLines: maxline,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 18.sp),
          controller: TextEditCont,
          cursorColor: colth,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttxt,
              hintStyle: TextStyle(color: colth, fontSize: 12.sp),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
              errorMaxLines: 1,
              errorStyle: TextStyle(fontSize: 10.sp, fontFamily: 'Montserrat')),
          validator: (value) {
            if (hinttxt == "Full Name") {
              if (value == "") {
                return "Empty field";
              }
              if (value!.length > 30) {
                return "Value Limit: 30 Letters";
              }
            } else if (hinttxt == "Email") {
              if (value == "") {
                return "Empty field";
              }
              final RegExp emailRegex = RegExp(
                  r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
              if (emailRegex.hasMatch(value.toString())) {
              } else {
                return "Invalid Format";
              }
            } else if (hinttxt == 'Enter Value') {
              if (value!.length > 8) {
                return "Value Limit: 8 Digits";
              }
            } else if (hinttxt == 'Phone') {
              if (value == "") {
                return "Empty field";
              }
              if (value!.length > 18) {
                return "Value Limit: 18 Digits";
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}
