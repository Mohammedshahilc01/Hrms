import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../View/CompanyCalendar_screen/CompanyCalendar_screen.dart';
import '../../View/ForgotPassword_screen/ForgotPassword_screen.dart';
import '../../View/Front_screen/Front_screen.dart';
import '../../View/Home_screen/Components/bottomNavigationWidget.dart';
import '../../View/Home_screen/Home_screen.dart';
import '../../View/LeaveRequest_screen/LeaveRequestScreen.dart';
import '../../View/Login_screen/Login_screen.dart';
import '../../View/NewLeave_screen/NewLeave_screen.dart';
import '../../View/Notification_screen/Notification_scree.dart';
import '../../View/PdfView_screen.dart';
import '../../View/ProfileUpdate_screen/UpdateProfile_screen.dart';
import '../../View/Regularization_screen/Regularization_screen.dart';
import '../../View/WorkFromHome_screen/WorkFromHome_screen.dart';
import '../../View/test.dart';
import '../../View/testData.dart';
import '../Route_names/Route_names.dart';
import '../Secure_Storage/Components/Secure_Storage_keys.dart';
import '../Secure_Storage/Secure_storage.dart';
import '../Widget/BottomNavigationWidget.dart';


class MyRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  const LoginScreen();
        },
        routes: [
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
              return  const HomeScreen();
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
          ),
          GoRoute(
            path: RouteNames.regularizationScreen,
            builder: (BuildContext context, state) {
              return  const RegularizationScreen();
            },
          ),
          GoRoute(
            path: RouteNames.companyCalendarScreen,
            builder: (BuildContext context, state) {
              return  const CompanyCalendarScreen();
            },
          ),
          GoRoute(
            path: RouteNames.pdfviewScreen,
            builder: (BuildContext context, state) {
              return  const PdfviewScreen();
            },
          ),
          GoRoute(
            path: RouteNames.notificationScreen,
            builder: (BuildContext context, state) {
              return  const NotificationScreen();
            },
          ),
          GoRoute(
            path: RouteNames.workFromHomeScreen,
            builder: (BuildContext context, state) {
              return  const WorkFromHomeScreen();
            },
          ),
          // GoRoute(
          //   path: RouteNames.timerScreen,
          //   builder: (BuildContext context, state) {
          //     return  const TimerScreen();
          //   },
          // ),
          // GoRoute(
          //   path: RouteNames.timerTest,
          //   builder: (BuildContext context, state) {
          //     return  const TimerTest();
          //   },
          // )
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
