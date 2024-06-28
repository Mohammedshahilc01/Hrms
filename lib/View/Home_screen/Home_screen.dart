import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:hrm/Controller/Provider/Provider.dart';
import 'package:hrm/Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import 'package:hrm/Controller/Secure_Storage/Secure_storage.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:hrm/View/Home_screen/Components/Announcement_widget.dart';
import 'package:hrm/View/Home_screen/Components/CheckIn_widget.dart';
import 'package:hrm/View/Home_screen/Components/Drawer_widget.dart';
import 'package:hrm/View/Home_screen/Components/LeaveStatus_widget.dart';
import 'package:hrm/View/Home_screen/Components/Photo_widget.dart';
import 'package:hrm/View/Home_screen/Components/bottomNavigationWidget.dart';
import 'package:hrm/Model/Local_notification.dart';
import 'package:provider/provider.dart';

import '../../Model/UserLogin_model.dart';
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   getUserDetails();
  //   super.initState();
  //
  // }
  // getUserDetails()async{
  //   var value=await SecureStorage.storage.read(key: SecureStorageKeys.userData);
  //   setState(() {
  //     _userLoginModel=UserLoginModel.fromJson(jsonDecode(value!));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderNotifier>(context).getDetails();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: GlobalVariable.key,
        body: SafeArea(
          child: Consumer<ProviderNotifier>(
            builder: (context, value, child) {
              return
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomPhoto(
                          name: "Welcome ${value.userLoginModel?.username}",
                          imgUrl: Image.asset("Images/profileImage.jpg"),
                          position: value.userLoginModel?.department,
                        ),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              const CustomCheckIn(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8.0, top: 10),
                                child: TextData(
                                  name: "Leave Status",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      CustomLeaveStatus(
                                          textColor: Colors.green,
                                          color: Colors.greenAccent[100],
                                          leave: "Casual Leaves",
                                          days: 1,
                                          icon: const Icon(Icons.hotel_sharp,
                                              size: 23, color: Colors.green)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomLeaveStatus(
                                          color: Colors.red[100],
                                          textColor: Colors.red,
                                          leave: "Sick Leaves",
                                          days: 3,
                                          icon: const Icon(Icons.sick,
                                              size: 23, color: Colors.red)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      CustomLeaveStatus(
                                          color: Colors.blue[100],
                                          textColor: Colors.blue,
                                          leave: "Privilege Leaves",
                                          days: 5,
                                          icon: const Icon(Icons.leave_bags_at_home,
                                              size: 23, color: Colors.blue)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0, top: 8.0),
                                  child: TextData(
                                    name: "Announcements",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              CustomAnnouncement(
                                color: Colors.blue,
                                title: 'Upload Documents',
                                data:
                                'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                              ),
                              CustomAnnouncement(
                                color: Colors.orangeAccent,
                                title: 'Meeting',
                                data: 'Meeting Scheduled on Monday',
                              ),
                              CustomAnnouncement(
                                color: Colors.greenAccent,
                                title: 'Upload Documents',
                                data:
                                'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                              ),
                              CustomAnnouncement(
                                color: Colors.amberAccent,
                                title: 'Upload Documents',
                                data:
                                'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                              ),
                              CustomAnnouncement(
                                color: Colors.orangeAccent,
                                title: 'Meeting',
                                data: 'Meeting Scheduled on Monday',
                              ),
                              CustomAnnouncement(
                                color: Colors.greenAccent,
                                title: 'Upload Documents',
                                data:
                                'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
            },
          ),
        ),
        drawer: const SafeArea(
          child: DrawerWidgetData(),
        ),
        // bottomNavigationBar:const CustomBottomNavigationBar(),
      ),
    );
  }
}
