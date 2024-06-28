import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:hrm/Controller/Route_names/Route_names.dart';
import 'package:hrm/Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';
import 'package:hrm/View/Splash_screen/Splash_screen.dart';

import '../../View/Front_screen/Front_screen.dart';
import '../../View/Home_screen/Components/bottomNavigationWidget.dart';
import '../../View/LeaveRequest_screen/LeaveRequestScreen.dart';
import '../../View/NewLeave_screen/NewLeave_screen.dart';
import '../../View/ProfileUpdate_screen/UpdateProfile_screen.dart';
import '../../View/test.dart';
import '../Secure_Storage/Secure_storage.dart';
import '../Widget/BottomNavigationWidget.dart';


class MyRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.bottomNavigation,
            builder: (BuildContext context, GoRouterState state) {
              return const BottomNavigationWidget();
            },
          ),
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
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: RouteNames.updateProfile,
            builder: (BuildContext context, state) {
              return const UpdateProfileScreen();
            },
          ) ,
          GoRoute(
            path: RouteNames.frontScreen,
            builder: (BuildContext context, state) {
              return  const FrontScreen();
            },
          ),
          GoRoute(
            path: RouteNames.leaveRequestScreen,
            builder: (BuildContext context, state) {
              return  const LeaveRequestScreen();
            },
          ),
          GoRoute(
            path: RouteNames.newLeavePage,
            builder: (BuildContext context, state) {
              return  const NewLeavePage();
            },
          )
          // GoRoute(
          //   path: RouteNames.myHomePage,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return  MyHomePage();
          //   },
          // ),
        ],
      ),
    ],
  );
}
