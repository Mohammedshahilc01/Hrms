import 'package:flutter/material.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
class PhotoWidgetData extends StatelessWidget {
  
  String? imgUrl;
  String? name;
  String? position;
  PhotoWidgetData({super.key, this.imgUrl,this.name,this.position});

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
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/medium-shot-smiley-man-posing_23-2149915892.jpg'),
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
                    name: "Welcome Muhammed",
                    fontWeight: FontWeight.bold,
                  ),
                  TextData(
                    name:"Flutter Developer",
                  )
                ],
              )
            ],
          ),
         const  Icon(
            Icons.notifications,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
