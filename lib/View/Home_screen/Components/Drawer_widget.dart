import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/Widget/ExpansionTileWidget.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:hrm/View/ProfileUpdate_screen/UpdateProfile_screen.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/Provider.dart';
import '../../../Controller/Route_names/Route_names.dart';
import '../../../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import '../../../Controller/Secure_Storage/Secure_storage.dart';
import '../../../Model/UserLogin_model.dart';

class DrawerWidgetData extends StatefulWidget {
  const DrawerWidgetData({super.key});

  @override
  State<DrawerWidgetData> createState() => _DrawerWidgetDataState();
}

class _DrawerWidgetDataState extends State<DrawerWidgetData> {
  UserLoginModel? _userLoginModel;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   getUserDetails();
  //   super.initState();
  // }
  //
  // getUserDetails()async{
  //   var value=await SecureStorage.storage.read(key: SecureStorageKeys.userData);
  //   setState(() {
  //     _userLoginModel=UserLoginModel.fromJson(jsonDecode(value!));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
   final providerData=Provider.of<ProviderNotifier>(context);
    return SafeArea(
      child: Drawer(
        shape: const Border(),
        elevation: 0.0,
        child: ListView(
          children: [
            Consumer<ProviderNotifier>(
              builder: (context, value, child) {
                return Container(
                  color: ColorList.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("Images/profileImage.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        TextData(
                          name: value.userLoginModel?.username,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        TextData(
                          name: value.userLoginModel?.empId,
                          color: Colors.white,
                        ),
                        TextData(
                          name: value.userLoginModel?.designation,
                          fontSize: 12,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                );
              },

            ),
            const ExpansionTile(
              title: Text('Home'),
              trailing: SizedBox(),
              shape: Border(),
            ),
            ExpansionTile(
              title: const Text('Profile'),
              shape: const Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8.0),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, "/UpdateProfile");
                        // context.go('/${RouteNames.updateProfile}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfileScreen(isFromHome: false,),));
                      },
                      child: const Text('Personal Details')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8.0),
                  child: TextButton(
                      onPressed: () => context.go('/${RouteNames.updateProfile}'),
                      child: const Text('Education Details')),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Leave'),
              shape: const Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8.0),
                  child: TextButton(
                      onPressed: () => context.go('/${RouteNames.leaveRequestScreen}'),
                      child: const Text('Leave Request')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8.0),
                  child: TextButton(
                      onPressed: () => context.go('/${RouteNames.leaveRequestScreen}'),
                      child: const Text('Leave Approval')),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Regularization'),
              trailing:  SizedBox(),
              shape: Border(),
            ),
            const ExpansionTile(
              title: Text('Calendar'),
              trailing:  SizedBox(),
              shape: Border(),
            ),
            ExpansionTile(
              title: const Text('Help'),
              shape: const Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8.0),
                  child: TextButton(
                      onPressed: () {}, child: const Text('Password Reset')),
                ),
              ],
            ),
            ExpansionTile(
              onExpansionChanged: (value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            providerData.logout(context);
                            // context.go('/${RouteNames.loginPage}');
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );

              },
              title: const Text('Log Out'),
              trailing: const SizedBox(),
              shape: const Border(),
            ),
          ],
        ),
      ),
    );
    // return Container(
  }
}
