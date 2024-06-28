import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hrm/Controller/MyRouter/routers.dart';
import 'package:hrm/Controller/Secure_Storage/Secure_storage.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';
import 'package:hrm/View/Splash_screen/Splash_screen.dart';
import 'package:provider/provider.dart';

import 'Controller/Provider/Provider.dart';
import 'Model/Local_notification.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotification.initialize(flutterLocalNotificationsPlugin);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SecureStorage.storage;
  await initHiveForFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(context)=>ProviderNotifier()),
        ],
        child: MaterialApp.router(
          routerConfig: MyRouter.router,
        ),
      ),
    );
  }
}