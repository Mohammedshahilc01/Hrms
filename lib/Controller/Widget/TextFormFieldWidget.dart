import 'package:flutter/material.dart';

class TextFormFieldData extends StatelessWidget {
  Icon? prefixIcon;
  Color? fillColor;
  double? withOpacity;
  String? hintText;

  TextFormFieldData(
      {super.key, this.prefixIcon, this.fillColor, this.withOpacity,this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.normal),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
            // borderSide: const BorderSide(color: Colors.black12)
          )),
    );
  }
}
