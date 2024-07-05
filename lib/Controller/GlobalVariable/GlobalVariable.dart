import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrm/View/NewLeave_screen/NewLeave_screen.dart';
import 'package:hrm/View/ProfileUpdate_screen/UpdateProfile_screen.dart';

import '../../View/Home_screen/Home_screen.dart';
import '../../View/LeaveRequest_screen/LeaveRequestScreen.dart';
import '../../View/test.dart';
import '../../View/testData.dart';
import '../../View/timerTest.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

class GlobalVariable {
  static GlobalKey<ScaffoldState> key = GlobalKey();
  static final formKey = GlobalKey<FormState>();
  static int index = 0;
  static String token = "";
  static bool? timerShow;
}

class StorageData {
  static writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}

class PageList {
  static List<Widget> tabList = [
    const HomeScreen(),
    const LeaveRequestScreen(),
    const NewLeavePage(),
    const UpdateProfileScreen(),
  ];
}

class FlutterToast {
  static print(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
