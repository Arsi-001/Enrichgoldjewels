import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gold_application_project/main.dart';
import 'constant.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.Headertxt});
  final Headertxt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context)
                //         .push(HeroDialogRoute(builder: (context) {
                //       return const _AddTodoPopupCard();
                //     }));
                //   },
                //   child: Hero(
                //     tag: heroAddTodo,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         LayoutBuilder(builder: (context, constraints) {
                //           return SvgPicture.asset(
                //             "assets/images/LBMA.svg",
                //             semanticsLabel: "ss1",
                //             width: MediaQuery.of(context).size.width * 0.15,
                //           );
                //         }),
                //         SizedBox(
                //           height: 5.h,
                //         ),
                //         Text(
                //           'London Rates',
                //           style: TextStyle(
                //               inherit: false,
                //               color: goldthemelite,
                //               fontFamily: 'Montserrat',
                //               fontWeight: FontWeight.w600,
                //               letterSpacing: 0.8,
                //               fontSize: 10.sp),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    if (Headertxt != "RATE ALERT") {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          val: 5,
                          State1: false,
                        ),
                      ));
                    } else {
                      return null;
                    }
                  },
                  child: Hero(
                    tag: heroAddTodo,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LayoutBuilder(builder: (context, constraints) {
                          return SvgPicture.asset(
                            "assets/images/Bell_pin.svg",
                            semanticsLabel: "ss",
                            width: MediaQuery.of(context).size.width * 0.07,
                          );
                        }),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Text(
                        //   'Set Alert',
                        //   style: TextStyle(
                        //       color: goldthemelite,
                        //       fontFamily: 'Montserrat',
                        //       fontWeight: FontWeight.w600,
                        //       letterSpacing: 0.8,
                        //       fontSize: 10.sp),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Headertxt,
                  style: TextStyle(
                      color: goldtheme,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                      fontSize: 20.sp),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class _AddTodoPopupCard extends StatelessWidget {
//   /// {@macro add_todo_popup_card}
//   const _AddTodoPopupCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w),
//         child: Hero(
//           tag: heroAddTodo,
//           child: Material(
//             color: Colors.black87,
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.r)),
//             child: Container(
//               height: 200.h,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     color: goldtheme,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.all(Radius.circular(25.r))),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Icon(
//                               UniconsLine.x,
//                               color: Colors.red,
//                               size: 25,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "LONDON RATES",
//                         style: TextStyle(
//                             color: goldtheme,
//                             fontFamily: "Montserrat",
//                             fontWeight: FontWeight.w600,
//                             fontSize: 24.sp),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "GOLD/AM",
//                             style: TextStyle(
//                                 color: goldtheme,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20.sp),
//                           ),
//                           Text(
//                             "GOLD/PM",
//                             style: TextStyle(
//                                 color: goldtheme,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 20.sp),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "1914.34",
//                             style: TextStyle(
//                                 color: Colors.white70,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 32.sp),
//                           ),
//                           Text(
//                             "1914.34",
//                             style: TextStyle(
//                                 color: Colors.white70,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 32.sp),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
