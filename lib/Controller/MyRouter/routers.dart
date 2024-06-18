
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Route_names/Route_names.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';
import 'package:hrm/View/Splash_screen/Splash_screen.dart';

class MyRouter{
  static  GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.loginPage,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: RouteNames.forgotPassword,
            builder: (BuildContext context, GoRouterState state) {
              return const ForgotpasswordScreen();
            },
          ),
          GoRoute(
            path: RouteNames.homePage,
            builder: (BuildContext context, GoRouterState state) {
              return  HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}