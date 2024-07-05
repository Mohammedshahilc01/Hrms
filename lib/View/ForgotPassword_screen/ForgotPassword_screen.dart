import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/Controller/Widget/TextFormFieldWidget.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

import '../../Controller/Route_names/Route_names.dart';
class ForgotpasswordScreen extends StatelessWidget {
  const ForgotpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 10,
                  color: Colors.grey.shade100,
                ),
                Column(
                  children: [
                    Container(
                      height: 35,
                      color: ColorList.loginInBoxColor,
                    ),
                    Container(
                      color: ColorList.loginInBoxColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.transparent,
                          ),
                          TextData(
                            name: PageNames.forgotPasswordPage,
                            fontSize: 16,
                          ),
                          IconButton(
                              onPressed: () {
                                context.go('/${RouteNames.loginPage}');
                              }, icon: const Icon(Icons.close))
                        ],
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            color: ColorList.loginInBoxColor,
                            image: const DecorationImage(
                                image: AssetImage('Images/SignPage_1.png'),
                                fit: BoxFit.fitHeight)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextData(
                        name: StringList.passwordRecovery,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: TextData(
                        name: StringList.restPasswordBody1,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextData(
                        name: StringList.restPasswordBody2,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: TextData(
                        name: StringList.email,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: TextFormFieldData(
                        hintText: StringList.email,
                        fillColor: Colors.white,
                      ),
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: GestureDetector(
                          onTap: () {
                            // context.go('/HomePage');
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ColorList.backgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                    child: TextData(
                                      name: StringList.submit,
                                      color: Colors.white,
                                    )),
                              )),
                        )),

                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(
      size.width / 8,
      5 * (size.height / 5),
      7 * (size.width / 7.9),
      size.height / 2.5,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
// class MyCustomBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(0, size.height * 0.3);
//     path.cubicTo(
//         size.width, 50,   // Control point 1
//         size.width * 4, 0,   // Control point 2
//         size.width, size.height * 0.3  // End point
//     );
//
//     path.lineTo(size.width, size.height);
//
//     // Draw a horizontal line to the bottom left corner
//     path.lineTo(0, size.height);
//
//     // Close the path
//     path.close();
//
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }


// body: SafeArea(
//   child: Stack(
//     children: [
//       Container(
//         color: Colors.deepOrange,
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 50),
//                   child: TextData(
//                     name: StringList.keelInfoSolution,
//                     color: ColorList.keelInfo,
//                   ),
//                 ),
//                 const Icon(
//                   Icons.copyright,
//                   size: 15,
//                 ),
//                 TextData(
//                   color: ColorList.copyright,
//                   fontSize: 10,
//                   fontWeight: FontWeight.normal,
//                   name: StringList.copyright,
//                   letterSpacing: 4,
//                 ),
//                 TextData(
//                   name: StringList.allRightReserved,
//                   color: ColorList.allRightReserved,
//                   fontSize: 10,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 const SafeArea(
//                   child:  SizedBox(
//                     height: 10,
//                   ),
//                 ),
//
//               ],
//             )),
//       ),
//       Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 1.4,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius:
//             BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     TextData(
//                       name: StringList.reset,
//                       color: ColorList.textDeepOrange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                     ),
//                     TextData(
//                       name: StringList.resetYourPassword,
//                       color: ColorList.textDeepOrange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: TextData(
//                   name: StringList.resetPasswordHead,
//                   color: ColorList.copyright,
//                   fontSize: 10,
//                 ),
//               ),
//               Form(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormFieldData(
//                         prefixIcon: const Icon(Icons.email_outlined,size: 20,),
//                         fillColor: ColorList.textFieldFilledColor,
//                         withOpacity: 0.10,
//                         hintText: StringList.email,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: TextData(
//                   name: StringList.restPasswordBody,
//                   color: ColorList.copyright,
//                   fontSize: 10,
//                 ),
//               ),
//               const SizedBox(height: 15,),
//
//               GestureDetector(
//                 onTap: () {
//                   print('asfsDGSDG');
//                 },
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       color: Colors.deepOrange, shape: BoxShape.circle),
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.arrow_forward_outlined,
//                       color: Colors.white,
//                       size: 45,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(),
//             ],
//           ))
//     ],
//   ),
// )
