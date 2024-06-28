import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Api_services/Api_services.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';

import '../../Model/UserLogin_model.dart';
import '../Route_names/Route_names.dart';
import '../Secure_Storage/Components/Secure_Storage_keys.dart';
import '../Secure_Storage/Secure_storage.dart';

ApiServices _apiServices = ApiServices();

class ProviderNotifier extends ChangeNotifier {
  bool showPassword=false;
  int selectedIndex=0;
  UserLoginModel? userLoginModel;
  bool loading=false;

  Future<void> login(String email, String password, BuildContext context)async{
     loading=true;
      notifyListeners();
      try{
        await _apiServices.userLogin(email,password).then((value) async {
          await SecureStorage.storage.write(key: SecureStorageKeys.token, value:value['tokenAuth']['token']);
          await SecureStorage.storage.write(key: SecureStorageKeys.userData, value:jsonEncode(value['tokenAuth']['user']));
          var userDetails=await SecureStorage.storage.read(key: SecureStorageKeys.userData);
          userLoginModel=UserLoginModel.fromJson(jsonDecode(userDetails!));
          loading=false;
          notifyListeners();
          if(value['tokenAuth']['success']==true){
            Future.delayed(
              const Duration(microseconds:0),
                  () => context.go('/${RouteNames.bottomNavigation}'),
            );
          }
          else{
            FlutterToast.print('Enter Valid Data');
          }

        });
      }catch(e){
        print('sdbgusadkasdkjbaskjd');
        print('sdbgusadkasdkjbaskjd');
        print('sdbgusadkasdkjbaskjd');
        print('sdbgusadkasdkjbaskjd');
        loading=false;
        notifyListeners();
      }


  }
  Future<void> getDetails() async {
    var userDetails=await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    if(userDetails!=null){
      userLoginModel=UserLoginModel.fromJson(jsonDecode(userDetails??""));
      notifyListeners();
    }

  }
  void passwordShow(){
    showPassword=!showPassword;
    notifyListeners();
  }
  void bottomNavigationBar(int index){
    selectedIndex=index;
    notifyListeners();
  }
}
