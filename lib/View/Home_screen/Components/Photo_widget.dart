import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Controller/GlobalVariable/GlobalVariable.dart';
import '../../../Controller/Route_names/Route_names.dart';
import '../../../Controller/Widget/TextWidget.dart';
class CustomPhoto extends StatelessWidget {
  
  Image? imgUrl;
  String? name;
  String? position;
  CustomPhoto({super.key, this.imgUrl,this.name,this.position});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: GlobalVariable.key.currentState?.openDrawer,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:AssetImage("Images/profileImage.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextData(
                    name: name,
                    fontWeight: FontWeight.bold,
                  ),
                  TextData(
                    name:position,
                  )
                ],
              )
            ],
          ),
           IconButton(
           onPressed: (){
             {
               context.go('/${RouteNames.notificationScreen}');
             }
           },
           icon: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
