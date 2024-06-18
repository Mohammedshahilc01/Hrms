import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  String? name;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  double? letterSpacing;

  TextData(
      {super.key,
      this.name,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name',
      style:
          TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color,letterSpacing: letterSpacing),
    );
  }
}
