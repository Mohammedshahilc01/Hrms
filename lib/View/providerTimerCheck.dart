// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../Controller/Api_services/Api_services.dart';
// import '../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
// import '../Controller/Secure_Storage/Secure_storage.dart';
// import '../Model/UserCheckInTest_model.dart';
// import '../Model/UserLogin_model.dart';
// import '../Model/UserLogout_model.dart';
//
// class TimerCheckProvider with ChangeNotifier {
//   Timer? _timer;
//   int _seconds = 0;
//   bool _isRunning = false;
//   bool isStarted=true;
//   bool loading = false;
//
//   int get seconds => _seconds;
//   bool get isRunning => _isRunning;
//   UserLoginModel? userLoginModel;
//   UserLogoutModel? userLogoutModel;
//   ApiServicesQuery apiServicesQuery = ApiServicesQuery();
//   UserCheckInTestModel? userCheckInTestModel;
//   DateTime checkTime=DateTime.now();
//
//
//   Future<void> userCheckInTestQuery() async {
//     DateTime now = DateTime.now();
//     var userDetails =
//     await SecureStorage.storage.read(key: SecureStorageKeys.userData);
//     userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
//     loading = true;
//     try {
//       await apiServicesQuery.userCheckInTestQuery(userLoginModel?.id).then((value) async {
//         userCheckInTestModel = UserCheckInTestModel.fromJson(value);
//         print(value);
//         print(value);
//         print(value);
//         if (userCheckInTestModel!.todayUserAttendanceDetails.isNotEmpty) {
//           checkTime = userCheckInTestModel!.todayUserAttendanceDetails[0].checkIn!;
//           Duration durationToAdd = const Duration(hours: 5, minutes: 30);
//           checkTime=checkTime.add(durationToAdd);
//           startTimerFromInput();
//           }
//       });
//     } catch (e) {
//       loading = false;
//       notifyListeners();
//     }
//   }
//
//
//   Future<void> startTimerFromInput() async {
//     DateTime now = DateTime.now();
//       var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(checkTime.toString()));
//       DateTime timeStarted = DateFormat("hh:mm:ss").parse(tempDate);
//       final checkInTimeDuration = timeStarted.hour * 3600 + timeStarted.minute * 60 + timeStarted.second;
//       final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
//       final totalTime = nowTimeDuration - checkInTimeDuration;
//       if (_isRunning) return;
//       _isRunning = true;
//       _seconds = totalTime;
//       startTimerInput();
//
//   }
//
//   void startTimerInput() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_seconds > 0) {
//         _seconds++;
//       } else {
//         _isRunning = false;
//         _timer?.cancel();
//       }
//       isStarted=true;
//       notifyListeners();
//     });
//   }
//
//   void startTimer() {
//     if (_isRunning) return;
//     _isRunning = true;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       _seconds++;
//       notifyListeners();
//     });
//   }
//
//   void stopTimer() {
//     if (!_isRunning) return;
//     _isRunning = false;
//     _timer?.cancel();
//     isStarted=false;
//     notifyListeners();
//   }
//
//   void resetTimer() {
//     _timer?.cancel();
//     _isRunning = false;
//     _seconds = 0;
//     notifyListeners();
//   }
//
//   String get formattedTime {
//     final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');
//     final minutes = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
//     final seconds = (_seconds % 60).toString().padLeft(2, '0');
//     return '$hours:$minutes:$seconds';
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }
