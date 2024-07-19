import 'dart:async';
import 'dart:convert';

import 'package:Sapiens/Model/UserCheckOutLogOutModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../Model/Local_notification.dart';
import '../../Model/UserAddLeaveMutation_model.dart';
import '../../Model/UserAttendanceDetails_model.dart';
import '../../Model/UserCheckInLoginModel.dart';
import '../../Model/UserCheckInLoginTESTModel.dart';
import '../../Model/UserCheckInTest_model.dart';
import '../../Model/UserCheckin_model.dart';
import '../../Model/UserCheckout_model.dart';
import '../../Model/UserDetails_model.dart';
import '../../Model/UserLeaveCountDetails_model.dart';
import '../../Model/UserLeaveRequestQuery_model.dart';
import '../../Model/UserLogin_model.dart';
import '../../Model/UserLogout_model.dart';
import '../../View/test.dart';
import '../Api_services/Api_services.dart';
import '../GlobalVariable/GlobalVariable.dart';
import '../Route_names/Route_names.dart';
import '../Secure_Storage/Components/Secure_Storage_keys.dart';
import '../Secure_Storage/Secure_storage.dart';
import '../String_list/String_list.dart';

ApiServicesMutation apiServicesMutation = ApiServicesMutation();
ApiServicesQuery apiServicesQuery = ApiServicesQuery();

class ProviderNotifier extends ChangeNotifier {
  bool showPassword = false;
  int selectedIndex = 0;
  UserLoginModel? userLoginModel;
  UserLogoutModel? userLogoutModel;
  UserLeaveRequestQueryModel? userLeaveRequestQueryModel;
  UserAddLeaveMutationModel? userAddLeaveMutationModel;
  // Logout? logoutModel;
  bool loading = true;
  bool isExpandedAwaiting = false;
  UserDetailsModel? userDetailsModel;
  UserLeaveCountDetailsModel? userLeaveCountDetailsModel;
  UserAttendanceDetailsModel? userAttendanceDetailsModel;

  Set<String> uniqueMonthYear = {};
  String selectedValue="";
  List<String> monthsList=[];
  List<UserAttendanceDetail> filteredUserAttendanceDetail=[];
  Map<String, DateTime> monthYearMap = {};
  List<String> monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];


  Future<void> login(String email, String password, BuildContext context) async {
    print('login');
    print('login');
    print('login');
    loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2),() async{
      try {
        await apiServicesMutation.userLogin(email, password).then((value) async {
          await SecureStorage.storage.write(
              key: SecureStorageKeys.token, value: value['tokenAuth']['token']);
          await SecureStorage.storage.write(
              key: SecureStorageKeys.userData,
              value: jsonEncode(value['tokenAuth']['user']));
          var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
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
        print('---------------------login---------------------');
        print(e);
        print('---------------------login---------------------');
        loading = false;
        notifyListeners();
      }
    },);
  }

  Future<void> logout(BuildContext context) async {
    // SecureStorage.storage.delete(key: SecureStorageKeys.token);
    loading = true;
    notifyListeners();
    // var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    // userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
          SecureStorage.storage.delete(key: SecureStorageKeys.token);
          context.go('/${RouteNames.loginPage}');
    loading = false;
    notifyListeners();
///////////////some issues on backend ///////////////////////////
    // try {
    //   await apiServicesMutation
    //       .userLogout(userLoginModel?.id)
    //       .then((value) async {
    //     logoutModel = Logout.fromJson(value['logout']);
    //     if (logoutModel?.logoutSet == true) {
    //       SecureStorage.storage.delete(key: SecureStorageKeys.token);
    //       context.go('/${RouteNames.loginPage}');
    //       loading = false;
    //       notifyListeners();
    //     } else {
    //       FlutterToast.print(StringList.tryAgainLater);
    //     }
    //   });
    // } catch (e) {
    //   loading = false;
    //   notifyListeners();
    //   FlutterToast.print(StringList.tryAgainLater);
    // }
    /////////////////////////////////////////////////////////////
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
      await apiServicesQuery
          .userLeaveRequestQuery(userLoginModel?.id)
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

  Future<void> userAddLeaveMutation(Map<String, dynamic> variables, String? id, String? teamLeader, String? typeOfLeave, String? causeOfLeave, String from, String toDate, String requestDate, BuildContext context,) async {
    loading = true;
    notifyListeners();
    try {
      await apiServicesMutation.userAddLeaveMutation(variables,id,teamLeader,typeOfLeave, causeOfLeave, from, toDate,  requestDate,).then((value) async {
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

  Future<void> getUserDetailQuery() async {
    print('getUserDetailQuery');
    print('getUserDetailQuery');
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2),() async{
      try {
        await apiServicesQuery.getUserDetailQuery(userLoginModel?.id).then((value) async {
          print('-----------getUserDetailQuery-------------------');
          print(value);
          userDetailsModel=UserDetailsModel.fromJson(value);
          print('-----------getUserDetailQuery-------------------');
          // userLeaveRequestQueryModel = UserLeaveRequestQueryModel.fromJson(value);
          loading = false;
          notifyListeners();
        });
      } catch (e) {
        loading = false;
        notifyListeners();
      }
    },);

  }

  Future<void> getUserLeaveDetailsQuery() async {
    print('getUserLeaveDetailsQuery');
    print('getUserLeaveDetailsQuery');
    // loading = true;
    // notifyListeners();
    Future.delayed(const Duration(seconds: 2),() async{
      print('open try class');
      print(GlobalVariable.userId);
      print('open try class');
      try {
        await apiServicesQuery.getUserLeaveDetailsQuery(GlobalVariable.userId).then((value) async {
          print('-----------getUserLeaveDetailsQuery-------------------');
          debugPrint(jsonEncode(value));
          userLeaveCountDetailsModel=UserLeaveCountDetailsModel.fromJson(value);
          print('-----------getUserLeaveDetailsQuery-------------------');
          loading = false;
          notifyListeners();
        });
      } catch (e) {
        print("---getUserLeaveDetailsQuery- e----------");
        print(e);
        print("---getUserLeaveDetailsQuery- e----------");
        loading = false;
        notifyListeners();
      }
    },);

  }

  Future<void> getUserAttendanceDetailsQuery() async {
    try {
      // loading = true;
      // notifyListeners();
      await apiServicesQuery.getUserAttendanceDetailsQuery(GlobalVariable.userId).then((value) async {
        debugPrint(jsonEncode(value));
        userAttendanceDetailsModel=UserAttendanceDetailsModel.fromJson(value);
        await userAttendanceMonthList();
        loading = false;
        notifyListeners();

      });
    } catch (e) {
      print("---getUserLeaveDetailsQuery- e----------");
      print(e);
      print("---getUserLeaveDetailsQuery- e----------");
      loading = false;
      notifyListeners();
    }

  }

  Future<void> userAttendanceMonthList()async {
    for (var e in userAttendanceDetailsModel?.userAttendanceDetails??[]) {
      DateTime date = DateTime.parse(e.checkIn.toString());
      int month = date.month;
      int year = date.year;
      String monthYear = '${monthNames[month - 1]} $year';
      uniqueMonthYear.add(monthYear);
      monthYearMap[monthYear] = date;
    }
    monthsList = uniqueMonthYear.toList()..sort((a, b) => monthYearMap[a]!.compareTo(monthYearMap[b]!));
    selectedValue=monthsList.last;
    filterAttendanceList();
  }

void filterAttendanceList(){
  filteredUserAttendanceDetail.clear();
  String dateString = selectedValue;
  List<String> separatedDate = dateString.split(' ');
  if (separatedDate.length == 2) {
    String selectedMonth = separatedDate[0];
    int selectedYear = int.parse(separatedDate[1]);
    for (var e in userAttendanceDetailsModel?.userAttendanceDetails??[]) {
      DateTime date = DateTime.parse(e.checkIn.toString());
      int month = date.month;
      int year = date.year;
      String monthName = monthNames[month - 1];
      if (monthName == selectedMonth && year == selectedYear) {
        filteredUserAttendanceDetail.add(e);
      }
      filteredUserAttendanceDetail.sort((a, b) {
        DateTime dateA = DateTime.parse(a.checkIn.toString());
        DateTime dateB = DateTime.parse(b.checkIn.toString());
        return dateA.compareTo(dateB);
      });
    }
  } else {
    print('Invalid date format');
  }
}
}

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;
  bool isStarted=true;
  bool isWorkTimeShow=false;
  bool loading = false;
  Duration totalWorkedTime = Duration.zero;
  UserCheckInModel? userCheckInModel;
  UserCheckOutModel? userCheckOutModel;
  UserCheckInLoginModel? userCheckInLoginModel;
  UserCheckOutLogOutModel? userCheckOutLogOutModel;


  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  UserLoginModel? userLoginModel;
  UserLogoutModel? userLogoutModel;
  ApiServicesQuery apiServicesQuery = ApiServicesQuery();
  UserCheckInTestModel? userCheckInTestModel;
  DateTime checkTime=DateTime.now();
  DateTime checkOut=DateTime.now();


  Future<void> userCheckInTestQuery() async {
    DateTime now = DateTime.now();
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    print("userDetails");
    print(userLoginModel?.id);
    print("userDetails");
    loading = true;
    notifyListeners();
    try {
      await apiServicesQuery.userCheckInTestQuery(userLoginModel?.id).then((value) async {
        userCheckInTestModel = UserCheckInTestModel.fromJson(value);
        print('09090909090');
        print(value);
        print(value);
        print(value);
        print('09090909090');
        if (userCheckInTestModel!.todayUserAttendanceDetails.isNotEmpty) {
          print('open open isNotEmpty');
          print('open open isNotEmpty');
          if( userCheckInTestModel!.todayUserAttendanceDetails[0].checkOut==null){
            checkTime = userCheckInTestModel!.todayUserAttendanceDetails[0].checkIn!;
            Duration durationToAdd = const Duration(hours: 5, minutes: 30);
            checkTime=checkTime.add(durationToAdd);
            startTimerFromInput();
          }
          else{
            checkTime = userCheckInTestModel!.todayUserAttendanceDetails[0].checkIn!;
            Duration durationToAdd = const Duration(hours: 5, minutes: 30);
            checkTime=checkTime.add(durationToAdd);
            String value = userCheckInTestModel!.todayUserAttendanceDetails[0].checkOut!;
            var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(value.toString()));
            checkOut = DateFormat("hh:mm:ss").parse(tempDate);
            Duration durationFromAdd = const Duration(hours: 5, minutes: 30);
            checkOut=checkOut.add(durationFromAdd);
            startTimerFromInputAndOutput();
          }
        }else{
          print('asdasdasd');
          print('asdasdasd');
          loading=false;
          _isRunning = false;
          isStarted=true;
          isWorkTimeShow=false;
          notifyListeners();
        }
      });
    } catch (e) {
      print('userCheckInTestQuery');
      print(e);
      print('userCheckInTestQuery');
      loading = false;
      notifyListeners();
    }
  }


  Future<void> startTimerFromInput() async {
    DateTime now = DateTime.now();
    var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(checkTime.toString()));
    DateTime timeStarted = DateFormat("hh:mm:ss").parse(tempDate);
    final checkInTimeDuration = timeStarted.hour * 3600 + timeStarted.minute * 60 + timeStarted.second;
    final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
    final totalTime = nowTimeDuration - checkInTimeDuration;
    if (_isRunning) return;
    _isRunning = true;
    isWorkTimeShow=true;
    _seconds = totalTime;
    startTimerInput();

  }

  Future<void> startTimerFromInputAndOutput() async {
    print("startTimerFromInputAndOutput");
    print("startTimerFromInputAndOutput");
    DateTime now = DateTime.now();
    var checkInTime = DateFormat("HH:mm:ss").format(DateTime.parse(checkTime.toString()));
    DateTime fromTime = DateFormat("hh:mm:ss").parse(checkInTime);
    var checkoutTime = DateFormat("HH:mm:ss").format(DateTime.parse(checkOut.toString()));
    DateTime toTime = DateFormat("hh:mm:ss").parse(checkoutTime);
    final checkInTimeDuration = fromTime.hour * 3600 + fromTime.minute * 60 + fromTime.second;
    final checkOutTimeDuration = toTime.hour * 3600 + toTime.minute * 60 + toTime.second;
    // final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
    final totalTime = checkOutTimeDuration - checkInTimeDuration;
    // if (_isRunning) return;
    // _isRunning = true;
    isWorkTimeShow=true;
    _seconds = totalTime;
    startTimerInputAndOutput();

  }

  void startTimerInput() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds++;
      } else {
        _isRunning = false;
        _timer?.cancel();
      }
      isStarted=true;
      loading=false;
      notifyListeners();
    });
  }
  void startTimerInputAndOutput() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        // _seconds++;
      } else {
        _isRunning = false;
        _timer?.cancel();
      }
      totalWorkedTime = Duration(seconds: _seconds);
      isStarted=false;
      loading=false;
      notifyListeners();
    });
  }

  void startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    loading=true;
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      isWorkTimeShow=true;
      loading=false;
      notifyListeners();
    });
  }

  void stopTimer() {
    if (!_isRunning) return;
    _isRunning = false;
    _timer?.cancel();
    totalWorkedTime = Duration(seconds: _seconds);
    isStarted=false;
    loading=false;
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _isRunning = false;
    _seconds = 0;
    notifyListeners();
  }

  String get formattedTime {
    final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }




  Future<void> userCheckInFirstAPI() async {
    print('open userCheckInFirstAPI');
    print('open userCheckInFirstAPI');
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2),() async {
      print('Future.delayed');
      print('Future.delayed');
      try {
        await apiServicesMutation.userCheckInLogin(userLoginModel?.id).then((value) async {
          print("----------- value userCheckInFirstAPI------------------");
          print(value);
          print("-----------value userCheckInFirstAPI------------------");
          if(value!=null){
            print("-----------userCheckInFirstAPI value!=null------------------");
            print(value);
            UserCheckInLoginTestModel  userCheckInLoginTestModel;
            userCheckInLoginTestModel=UserCheckInLoginTestModel.fromJson(value);
            print("UserCheckInLoginTestModel");
            print(userCheckInLoginTestModel);
            print(userCheckInLoginTestModel.data?.login?.loginSet);
            print("UserCheckInLoginTestModel");
            userCheckInLoginModel =UserCheckInLoginModel.fromJson(value);
            if(userCheckInLoginModel?.login?.loginSet==true){
              print("loginSet==true");
              print("loginSet==true");
              Future.delayed(const Duration(seconds: 2),() {
                userCheckInSecondAPI();
              },);
            }else{
              loading = false;
              notifyListeners();
              FlutterToast.print(StringList.tryAgainLater);
            }
          }else{
            print("-----------userCheckInFirstAPI Null------------------");
            FlutterToast.print(StringList.tryAgainLater);
            loading = false;
            notifyListeners();
          }

        });
      } catch (e) {
        print('---------------------login---------------------');
        print(e);
        print('---------------------login---------------------');
        loading = false;
        notifyListeners();
      }
    },);

  }

  Future<void> userCheckInSecondAPI() async {
    print('checkin open');
    DateTime now = DateTime.now();
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    Future.delayed(const Duration(seconds: 2),() async{
      try {
        await apiServicesMutation.userCheckInMutation(userLoginModel?.id).then((value) async {
          if(value!=null){
            userCheckInModel =UserCheckInModel.fromJson(value);
            print('--------------------userCheckInModel---------------------');
            print(value);
            // print(userCheckInModel);
            print('--------------------userCheckInModel---------------------');
            print(userCheckInModel?.checkInUpdate?.checkInUpdateSet);
            // print(userCheckInModel?.typename);
            // print(userCheckInModel?.checkInUpdate?.typename);
            // print(userCheckInModel?.checkInUpdate?.checkin);
            print('--------------------userCheckInModel---------------------');
            if(userCheckInModel?.checkInUpdate?.checkInUpdateSet==true){
              print('Check in is true');
              loading = false;
              notifyListeners();
              startTimer();
            }
            else{
              loading = false;
              notifyListeners();
              FlutterToast.print(StringList.tryAgainLater);
            }
          }else{
            loading = false;
            notifyListeners();
          }


        });
      } catch (e) {
        print('--------------userCheckInSecondAPI e-----------------');
        print(e);
        print('--------------userCheckInSecondAPI e-----------------');
        loading = false;
        notifyListeners();
        FlutterToast.print(StringList.tryAgainLater);
      }
    },);

  }

  Future<void> userCheckOutFirstAPI()async{


    print('open userCheckOutFirstAPI');
    print('open userCheckOutFirstAPI');
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    loading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 3),() async {
      print('Future.delayed');
      print(userLoginModel?.id);
      print('Future.delayed');
      try {
        await apiServicesMutation.userCheckOutLogOut(userLoginModel?.id).then((value) async {
          print("----------- value userCheckInFirstAPI------------------");
          print(value);
          print("-----------value userCheckInFirstAPI------------------");
          if(value!=null){
            print("-----------userCheckInFirstAPI value!=null------------------");
            print(value);
            print("UserCheckInLoginTestModel");
            userCheckOutLogOutModel =UserCheckOutLogOutModel.fromJson(value);
            if(userCheckOutLogOutModel?.logout?.logoutSet==true){
              print("loginSet==true");
              print("loginSet==true");
              Future.delayed(const Duration(seconds: 2),() {
                userCheckOutSecondAPI();
              },);
            }else{
              loading = false;
              notifyListeners();
              FlutterToast.print(StringList.tryAgainLater);
            }
          }else{
            print("-----------userCheckInFirstAPI Null------------------");
            FlutterToast.print(StringList.tryAgainLater);
            loading = false;
            notifyListeners();
          }

        });
      } catch (e) {
        print('---------------------login---------------------');
        print(e);
        print('---------------------login---------------------');
        loading = false;
        notifyListeners();
      }
    },);

  }

  Future<void> userCheckOutSecondAPI() async {
    DateTime now = DateTime.now();
    var userDetails = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(userDetails!));
    print("userCheckOut?.id");
    print(userLoginModel?.id);
    print("userLoginModel?.id");
    try {
      await apiServicesMutation.userCheckOutMutation(userLoginModel?.id).then((value) async {

        userCheckOutModel =UserCheckOutModel.fromJson(value);
        print('checkOut');
        print('checkOut');
        print(value);
        print(userCheckOutModel?.data?.checkOut);
        print('checkOut');
        stopTimer();
      });
    } catch (e) {
      print('-------------------------');
      print(e);
      print('-------------------------');

      FlutterToast.print(StringList.tryAgainLater);
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
