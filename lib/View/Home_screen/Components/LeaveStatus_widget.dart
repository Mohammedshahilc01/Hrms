import 'package:flutter/material.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

class LeaveStatusWidgetData extends StatelessWidget {
  Icon? icon;
  String? leave;
  int? days;
  Color? color;
  Color? textColor;

  LeaveStatusWidgetData(
      {super.key,
      this.icon,
      this.leave,
      this.days,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 10, right: 10),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: icon,
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextData(
                name: leave,
                fontWeight: FontWeight.w300,
                fontSize: 13,
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
              child: TextData(
                name: '$days Days',
                color: textColor,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
