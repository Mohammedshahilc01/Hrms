import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Api_services/Api_services.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/Route_names/Route_names.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/Controller/Widget/TextFormFieldWidget.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorList.loginInBoxColor,
    ));
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
                child: Stack(
          children: [
            Container(
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
                        name: PageNames.signInPage,
                        fontSize: 16,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close))
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
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextData(
                    name: StringList.welcome,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextData(
                    name: StringList.singToContinue,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 15, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    spreadRadius: 2,
                                    blurRadius: 2)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'Images/google_logo.png'))),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextData(
                                name: 'Google',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    spreadRadius: 2,
                                    blurRadius: 2)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'Images/outlook_Logo.png'))),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextData(
                                name: 'Outlook',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: TextData(
                        name: StringList.orLoginWith, color: Colors.grey)),
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
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: TextData(
                    name: StringList.password,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormFieldData(
                    hintText: StringList.password,
                    fillColor: Colors.white,
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: GestureDetector(
                        onTap: (){context.go('/ForgotPassword');},
                          child: TextData(
                        name: StringList.forgotPassword,
                        color: ColorList.backgroundColor,
                      )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorList.backgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                              child: TextData(
                            name: StringList.login,
                            color: Colors.white,
                          )),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextData(
                        name: StringList.dontHaveAccount,
                        color: Colors.grey,
                      ),
                      TextData(
                        name: StringList.singUp,
                        color: ColorList.backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
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
//                 BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     TextData(
//                       name: StringList.logInto,
//                       color: ColorList.textDeepOrange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                     ),
//                     TextData(
//                       name: StringList.yourAccount,
//                       color: ColorList.textDeepOrange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 35,
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Form(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormFieldData(
//                             prefixIcon: const Icon(Icons.email_outlined,size: 20,),
//                             fillColor: ColorList.textFieldFilledColor,
//                             withOpacity: 0.10,
//                             hintText:StringList.enterYourEmail,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormFieldData(
//                             prefixIcon: const Icon(Icons.password_outlined,size: 20,),
//                             fillColor: ColorList.textFieldFilledColor,
//                             withOpacity: 0.10,
//                             hintText:StringList.enterYourPassword,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.check_box_outline_blank,size: 15,),
//                         const SizedBox(width: 10,),
//                         TextData(
//                           name: StringList.rememberMe,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                           color: ColorList.textGreyColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 15,),
//                   GestureDetector(
//                     onTap: (){
//                       context.go("/${RouteNames.forgotPassword}");
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextData(
//                           name: StringList.forgotPassword,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                           color: ColorList.textGreyColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               GestureDetector(
//                 onTap: () {
//                   // ApiServices apiService=ApiServices();
//                   // apiService.userLogin();
//                   context.go("/${RouteNames.homePage}");
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
//             ],
//           ))
//     ],
//   ),
// )