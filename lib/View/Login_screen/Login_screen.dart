import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.deepOrange,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: TextData(
                            name: StringList.keelInfoSolution,
                            color: ColorList.keelInfo,
                          ),
                        ),
                        const Icon(
                          Icons.copyright,
                          size: 15,
                        ),
                        TextData(
                          color: ColorList.copyright,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          name: StringList.copyright,
                          letterSpacing: 4,
                        ),
                        TextData(
                          name: StringList.allRightReserved,
                          color: ColorList.allRightReserved,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                        const SafeArea(
                          child:  SizedBox(
                            height: 10,
                          ),
                        ),

                      ],
                    )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextData(
                              name: StringList.logInto,
                              color: ColorList.textDeepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                            TextData(
                              name: StringList.yourAccount,
                              color: ColorList.textDeepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Form(
                            child: Column(
                              children: [
                                TextFormFieldData(
                                  prefixIcon: const Icon(Icons.email_outlined,size: 20,),
                                  fillColor: ColorList.textFieldFilledColor,
                                  withOpacity: 0.10,
                                  hintText:StringList.enterYourEmail,
                                ),
                                TextFormFieldData(
                                  prefixIcon: const Icon(Icons.password_outlined,size: 20,),
                                  fillColor: ColorList.textFieldFilledColor,
                                  withOpacity: 0.10,
                                  hintText:StringList.enterYourPassword,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(Icons.check_box_outline_blank,size: 15,),
                                const SizedBox(width: 10,),
                                TextData(
                                  name: StringList.rememberMe,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: ColorList.textGreyColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          GestureDetector(
                            onTap: (){
                              context.go("/${RouteNames.forgotPassword}");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextData(
                                  name: StringList.forgotPassword,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: ColorList.textGreyColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () {
                          context.go("/${RouteNames.homePage}");
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.deepOrange, shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
