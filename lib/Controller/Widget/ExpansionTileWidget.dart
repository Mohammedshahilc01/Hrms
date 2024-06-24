import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomExpansionTile extends StatelessWidget {
  String? title;
  bool? shapeBorder;
  CustomExpansionTile({super.key, this.title,this.shapeBorder});

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      title: Text('$title'),
      shape: Border(),
      maintainState: true,
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
          child: Text(''),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
          child: Text(''),
        ),
      ],
    );
  }
}


