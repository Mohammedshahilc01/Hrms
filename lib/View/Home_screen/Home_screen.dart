import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';


import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/GlobalVariable/GlobalVariable.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import '../../Controller/Secure_Storage/Secure_storage.dart';
import '../../Controller/Widget/TextWidget.dart';
import '../../Model/UserLogin_model.dart';
import '../../main.dart';
import 'Components/Action._widget.dart';
import 'Components/Announcement_widget.dart';
import 'Components/CheckIn_widget.dart';
import 'Components/Drawer_widget.dart';
import 'Components/LeaveStatus_widget.dart';
import 'Components/Photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserLoginModel? userLoginModel;
  @override
  void initState() {
    // TODO: implement initState
    getUserDetails();
    Provider.of<ProviderNotifier>(context,listen: false).getUserLeaveDetailsQuery();
    super.initState();

  }
  getUserDetails()async{
    var value=await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    setState(() {
      userLoginModel=UserLoginModel.fromJson(jsonDecode(value!));
      GlobalVariable.userId=userLoginModel?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: GlobalVariable.key,
        body: Stack(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomPhoto(
                        name: "Welcome ${userLoginModel?.username}",
                        imgUrl: Image.asset("Images/profileImage.jpg"),
                        position: userLoginModel?.department,
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const ActionWidget(),
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
                            Consumer<ProviderNotifier>(
                              builder: (context, value, child) {
                                final data=value.userLeaveCountDetailsModel;
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child:Row(
                                      children: [
                                        CustomLeaveStatus(
                                            textColor: Colors.green,
                                            color: Colors.greenAccent[100],
                                            leave: "Casual Leaves",
                                            days: '${data?.leaveConfigurationByMe[0].casualLeave}',
                                            icon: const Icon(Icons.hotel_sharp,
                                                size: 23, color: Colors.green)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomLeaveStatus(
                                            color: Colors.red[100],
                                            textColor: Colors.red,
                                            leave: "Sick Leaves",
                                            days: '${data?.leaveConfigurationByMe[0].sickLeave}',
                                            icon: const Icon(Icons.sick,
                                                size: 23, color: Colors.red)),
                                        // const SizedBox(
                                        //   width: 5,
                                        // ),
                                        // CustomLeaveStatus(
                                        //     color: Colors.blue[100],
                                        //     textColor: Colors.blue,
                                        //     leave: "Privilege Leaves",
                                        //     days: 5,
                                        //     icon: const Icon(Icons.leave_bags_at_home,
                                        //         size: 23, color: Colors.blue)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomLeaveStatus(
                                            textColor: Colors.orange,
                                            color: Colors.orange[100],
                                            leave: "Restricted Leave",
                                            days:'${data?.leaveConfigurationByMe[0].restrictedLeave}',
                                            icon: const Icon(Icons.home_outlined,
                                                size: 23, color: Colors.orange)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomLeaveStatus(
                                            textColor: Colors.pink,
                                            color: Colors.pink[100],
                                            leave: "EarnedLeave",
                                            days:'${data?.leaveConfigurationByMe[0].earnedLeave}',
                                            icon: const Icon(Icons.payments,
                                                size: 23, color: Colors.pink)),
                                      ],
                                    ) ,
                                  ),
                                );
                              },
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
                              color: Colors.blue[100],
                              title: 'Upload Documents',
                              data:
                              'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                            ),
                            CustomAnnouncement(
                              color: Colors.orangeAccent[100],
                              title: 'Meeting',
                              data: 'Meeting Scheduled on Monday',
                            ),
                            CustomAnnouncement(
                              color: Colors.greenAccent[100],
                              title: 'Upload Documents',
                              data:
                              'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                            ),
                            CustomAnnouncement(
                              color: Colors.amberAccent[100],
                              title: 'Upload Documents',
                              data:
                              'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                            ),
                            CustomAnnouncement(
                              color: Colors.orangeAccent[100],
                              title: 'Meeting',
                              data: 'Meeting Scheduled on Monday',
                            ),
                            CustomAnnouncement(
                              color: Colors.greenAccent[100],
                              title: 'Upload Documents',
                              data:
                              'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                            ),
                            CustomAnnouncement(
                              color: Colors.greenAccent[100],
                              title: 'Upload Documents',
                              data:
                              'Upload your last degree documents or send to Hr email idUpload your last degree documents or send to Hr email id',
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Consumer<TimerProvider>(
              builder: (context, value, child) {
                if(value.loading) {
                  return  Center(child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: ColorList.backgroundColor,
                    strokeWidth: 5,
                    semanticsLabel: 'Loading',
                    strokeCap: StrokeCap.square,
                  ));
                }
                return const SizedBox();
              },),
          ],
        ),
        drawer: const SafeArea(
          child: DrawerWidgetData(),
        ),
        // bottomNavigationBar:const CustomBottomNavigationBar(),
      ),
    );
  }
}


