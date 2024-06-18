import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/Route_names/Route_names.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: ColorList.backgroundColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                GestureDetector(
                  onTap: (){
                   context.go("/${RouteNames.loginPage}");
                  },
                    child: const Image(image: AssetImage('Images/Splash_screen_logo.png'))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextData(
                        name: StringList.keelInfoSolution,
                        color: ColorList.keelInfo,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                ),
              ],
            )));
  }
}
