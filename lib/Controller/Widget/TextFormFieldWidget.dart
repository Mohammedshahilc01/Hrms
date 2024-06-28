import 'package:flutter/material.dart';

class TextFormFieldData extends StatelessWidget {
  Icon? prefixIcon;
  Color? fillColor;
  double? withOpacity;
  String? hintText;
  bool? obscureText;
  final String? errorText;
  final GlobalKey? formKey;
  final TextEditingController? textEditingController;

  TextFormFieldData(
      {super.key,
      this.prefixIcon,
      this.fillColor,
      this.withOpacity,
      this.hintText,
      this.formKey,
      this.textEditingController,
      this.errorText,
      this.obscureText});

  bool validate = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: textEditingController,
      obscureText: (obscureText ?? false) ? true : false,
      validator: (value) {
        if (errorText!.contains('Email')) {
          if (value.toString().isEmpty || !value.toString().contains('@')) {
            return '$errorText';
          } else {
            validate = true;
          }
        } else if (value == null || value.isEmpty) {
          return '$errorText';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          prefixIcon: prefixIcon,
          // suffixIcon:IconButton(
          //   icon: (obscureText ?? false)?const Icon(Icons.remove_red_eye):const Icon(Icons.remove_red_eye_outlined), onPressed: () {  },
          // ),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 13, color: Colors.grey, fontWeight: FontWeight.normal),
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
