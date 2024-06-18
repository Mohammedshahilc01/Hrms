import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/MyRouter/routers.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';
import 'package:hrm/View/Splash_screen/Splash_screen.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:MyRouter.router,
    );
  }
}
