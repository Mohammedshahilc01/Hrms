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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.normal),
            fillColor: fillColor?.withOpacity(0.10),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
              // borderSide: const BorderSide(color: Colors.black12)
            )),
      ),
    );
  }
}
