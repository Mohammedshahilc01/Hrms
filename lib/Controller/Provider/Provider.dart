import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Api_services/Api_services.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:intl/intl.dart';

import '../../Model/Local_notification.dart';
import '../../Model/UserAddLeaveMutation_model.dart';
import '../../Model/UserCheckInTest_model.dart';
import '../../Model/UserLeaveRequestQuery_model.dart';
import '../../Model/UserLogin_model.dart';
import '../../Model/UserLogout_model.dart';
import '../../View/test.dart';
import '../Route_names/Route_names.dart';
import '../Secure_Storage/Components/Secure_Storage_keys.dart';
import '../Secure_Storage/Secure_storage.dart';
import '../String_list/String_list.dart';

ApiServices _apiServices = ApiServices();

class ProviderNotifier extends ChangeNotifier {
  bool showPassword = false;
  int selectedIndex = 0;
  UserLoginModel? userLoginModel;
  UserLogoutModel? userLogoutModel;
  UserLeaveRequestQueryModel? userLeaveRequestQueryModel;
  UserAddLeaveMutationModel? userAddLeaveMutationModel;
  Logout? logoutModel;

  bool loading = false;
  bool isExpandedAwaiting = false;

  Future<void> login(
      String email, String password, BuildContext context) async {
    loading = true;
    notifyListeners();
    try {
      await _apiServices.userLogin(email, password).then((value) async {
        await SecureStorage.storage.write(
            key: SecureStorageKeys.token, value: value['tokenAuth']['token']);
        await SecureStorage.storage.write(
            key: SecureStorageKeys.userData,
            value: jsonEncode(value['tokenAuth']['user']));
        var userDetails =
            await SecureStorage.storage.read(key: SecureStorageKeys.userData);
        userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
        loading = false;
        notifyListeners();
        if (value['tokenAuth']['success'] == true) {
          Future.delayed(
            const Duration(microseconds: 0),
            () => context.go('/${RouteNames.bottomNavigation}'),
          );
        } else {
          FlutterToast.print('Enter Valid Data');
        }
      });
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    // SecureStorage.storage.delete(key: SecureStorageKeys.token);
    loading = true;
    notifyListeners();
    var userDetails =
        await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));

    try {
      await _apiServices.userLogout(userLoginModel?.id).then((value) async {
        logoutModel = Logout.fromJson(value['logout']);
        if (logoutModel?.logoutSet == true) {
          SecureStorage.storage.delete(key: SecureStorageKeys.token);
          context.go('/${RouteNames.loginPage}');
          loading = false;
          notifyListeners();
        } else {
          FlutterToast.print(StringList.tryAgainLater);
        }
      });
    } catch (e) {
      loading = false;
      notifyListeners();
      FlutterToast.print(StringList.tryAgainLater);
    }
  }

  Future<void> getDetails() async {
    var userDetails =
        await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    if (userDetails != null) {
      userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails ?? ""));
      notifyListeners();
    }
  }

  void passwordShow() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void bottomNavigationBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> userLeaveRequestQuery(BuildContext context) async {
    var userDetails =
        await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    loading = true;
    try {
      await _apiServices.userLeaveRequestQuery(userLoginModel?.id)
          .then((value) async {
        userLeaveRequestQueryModel = UserLeaveRequestQueryModel.fromJson(value);
        loading = false;
        notifyListeners();
      });
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> userAddLeaveMutation(
    String? userId,
    String? teamLeader,
    String? typeOfLeave,
    String? causeOfLeave,
    String fromDate,
    String toDate,
    String requestDate,
    BuildContext context,
  ) async {
    loading = true;
    notifyListeners();
    try {
      await _apiServices.userAddLeaveMutation(userId, teamLeader, typeOfLeave, causeOfLeave,
              fromDate, toDate, requestDate)
          .then((value) async {
        if (value != null) {
          userAddLeaveMutationModel =
              UserAddLeaveMutationModel.fromJson(value['addleaveApproval']);
          FlutterToast.print('Success');
          Future.delayed(
            const Duration(microseconds: 0),
            () => context.go('/${RouteNames.leaveRequestScreen}'),
          );
        } else {
          loading = false;
          notifyListeners();
          FlutterToast.print(StringList.tryAgainLater);
        }
      });
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }





}

class TimerProvider with ChangeNotifier {
  int _remainingSeconds = 0;
  Timer? _timer;
  bool loading=false;

  int get remainingSeconds => _remainingSeconds;
  bool checkIn = true;
  bool checkInToday = false;
  bool totalTimeShow = true;
  DateTime? startTime;
  DateTime checkTime=DateTime.now();
  UserLoginModel? userLoginModel;
  UserCheckInTestModel? userCheckInTestModel;
  Duration totalWorkedTime = Duration.zero;

  Future<void> startTimer() async {
    if(checkTime==null){

      // DateTime tempDate = DateFormat("hh:mm:ss").parse(dat.toString());
      // print(tempDate);
      print('open dat open');
      print(checkTime);
      print('open dat open');
    }
    final secureDate = await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
    DateTime now = DateTime.now();
    if (secureDate != null) {
      // startTime = secureDate;
      checkIn = false;
      totalTimeShow = false;
      notifyListeners();
      DateTime tempDate = DateFormat("hh:mm:ss").parse(secureDate);
      final checkInTimeDuration = tempDate.hour * 3600 + tempDate.minute * 60 + tempDate.second;
      final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
      final totalTime = nowTimeDuration - checkInTimeDuration;
      _remainingSeconds = totalTime;
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          _remainingSeconds++;
        } else {
          timer.cancel();
          notifyListeners();
        }
      });
    } else {
      print('error');
    }
  }
  // Future<void> startTimer() async {
  //
  //   final secureDate = await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
  //   DateTime now = DateTime.now();
  //   if (secureDate != null) {
  //     startTime = secureDate;
  //     checkIn = false;
  //     totalTimeShow = false;
  //     notifyListeners();
  //     DateTime tempDate = DateFormat("hh:mm:ss").parse(secureDate);
  //     final checkInTimeDuration =
  //         tempDate.hour * 3600 + tempDate.minute * 60 + tempDate.second;
  //     final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
  //     final totalTime = nowTimeDuration - checkInTimeDuration;
  //     _remainingSeconds = totalTime;
  //     _timer?.cancel();
  //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //       if (_remainingSeconds > 0) {
  //         _remainingSeconds++;
  //       } else {
  //         timer.cancel();
  //         notifyListeners();
  //       }
  //     });
  //   } else {
  //     print('error');
  //   }
  // }

  void stopTimer() async {
    await SecureStorage.storage.delete(key: SecureStorageKeys.checkInTime);
    _timer?.cancel();
    // checkIn=true;
    totalTimeShow = true;
    checkInToday = true;
    totalWorkedTime = Duration(seconds: remainingSeconds);
    notifyListeners();
  }

  Future<void> userCheckInTestQuery() async {
    DateTime now = DateTime.now();
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    loading = true;
    try {
      await _apiServices.userCheckInTestQuery(userLoginModel?.id).then((value) async {

        if(value['todayUserAttendanceDetails']!=null){
          userCheckInTestModel=UserCheckInTestModel.fromJson(value);
          checkTime=userCheckInTestModel!.todayUserAttendanceDetails[0].checkIn!;
          final actualTime= (checkTime.hour + 5) * 3600 + (checkTime.minute + 30) * 60 + checkTime.second;
          startTime = checkTime;
          checkIn = true;
          // checkIn = false;
          totalTimeShow = false;
          notifyListeners();
          final checkInTimeDuration = (checkTime.hour + 5) * 3600 + (checkTime.minute + 30) * 60 + checkTime.second;
          final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
          final totalTime = nowTimeDuration - checkInTimeDuration;
          _remainingSeconds = totalTime;
          _timer?.cancel();
          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (_remainingSeconds > 0) {
              _remainingSeconds++;
            } else {
              timer.cancel();
              notifyListeners();
            }
          });
          loading = false;
          notifyListeners();
        }

      });
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }
}

// DateTime now = DateTime.now();
// final value = await SecureStorage.storage.read(
// key: SecureStorageKeys.checkInTime.toString());
// DateTime tempDate = DateFormat("hh:mm:ss").parse(value!);
// final checkInTimeDuration = tempDate.hour * 3600 + tempDate.minute * 60 +
// tempDate.second;
// final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
