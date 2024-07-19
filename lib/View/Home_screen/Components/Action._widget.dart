
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Color_list/Color_list.dart';
import '../../../Controller/Provider/Provider.dart';
import '../../../Controller/Route_names/Route_names.dart';
import '../../../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import '../../../Controller/Secure_Storage/Secure_storage.dart';
import '../../../Controller/Widget/TextWidget.dart';
import '../../../Model/Local_notification.dart';
import '../../../Model/UserCheckInTest_model.dart';
import '../../../Model/UserLogin_model.dart';
import '../../../main.dart';
import '../../NewLeave_screen/NewLeave_screen.dart';
import '../../providerTimerCheck.dart';

class ActionWidget extends StatefulWidget {
  const ActionWidget({super.key});

  @override
  State<ActionWidget> createState() => _CustomCheckInState();
}

class _CustomCheckInState extends State<ActionWidget> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   print('userCheckInTestQuery');
  //   print('userCheckInTestQuery');
  //   Provider.of<TimerProvider>(context, listen: false).userCheckInTestQuery();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5,),
              Align(
                alignment: Alignment.center,
                  child: TextData(name: "Quick Actions",color: Colors.grey,)),
           const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewLeavePage(),));
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Icon(Icons.sticky_note_2_outlined,color: ColorList.backgroundColor,size: 18,),
                          )),
                      TextData(name: "Apply",fontSize: 10,),
                      TextData(name: "Leave",fontSize: 10,)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    context.go('/${RouteNames.workFromHomeScreen}');
                  },
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Icon(Icons.home_outlined,color: ColorList.backgroundColor,size: 18,),
                          )),
                      TextData(name: "Apply",fontSize: 10,),
                      TextData(name: "WFH",fontSize: 10,)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    context.go('/${RouteNames.pdfviewScreen}');
                    // context.go('/PdfviewScreen');
                  },
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Icon(Icons.payments,color: ColorList.backgroundColor,size: 18,),
                          )),
                      TextData(name: "View",fontSize: 10,),
                      TextData(name: "Payslip",fontSize: 10,)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(Icons.airplane_ticket_outlined,color: ColorList.backgroundColor,size: 18,),
                        )),
                    TextData(name: "Raise",fontSize: 10,),
                    TextData(name: "Ticket",fontSize: 10,)
                  ],
                ),
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(Icons.money,color: ColorList.backgroundColor,size: 18,),
                        )),
                    TextData(name: "Raise",fontSize: 10,),
                    TextData(name: "Expense",fontSize: 10,)
                  ],
                ),


              ],
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }


}
