import 'package:flutter/material.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
class CustomAnnouncement extends StatelessWidget {
  String? title;
  String? data;
  final Color? color;

   CustomAnnouncement({super.key, this.title,this.data,this.color});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            // BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 5,
            //     spreadRadius: 0.9)
          ],
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:  const EdgeInsets.only(
                left: 10,
                top: 13,
                bottom: 10,
              ),
              child: TextData(
                name:title,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Padding(
              padding:  const EdgeInsets.only(
                  left: 10, bottom: 8.0, right: 10),
              child: TextData(
                name: data,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              )
            )
          ],
        ),
      ),
    );
  }
}
