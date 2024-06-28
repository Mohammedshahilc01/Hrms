// import 'package:flutter/material.dart';
//
// class PasswordTextFormFieldData extends StatefulWidget {
//   Icon? prefixIcon;
//   Color? fillColor;
//   double? withOpacity;
//   String? hintText;
//   final String? errorText;
//   final GlobalKey? formKey;
//   final TextEditingController? textEditingController;
//
//   PasswordTextFormFieldData(
//       {super.key,
//       this.prefixIcon,
//       this.fillColor,
//       this.withOpacity,
//       this.hintText,
//       this.formKey,
//       this.textEditingController,
//       this.errorText});
//
//   @override
//   State<PasswordTextFormFieldData> createState() => _PasswordTextFormFieldDataState();
// }
//
// class _PasswordTextFormFieldDataState extends State<PasswordTextFormFieldData> {
//   bool validate = false;
//
//   bool passwordVisible = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     passwordVisible=false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: widget.formKey,
//       controller: widget.textEditingController,
//       obscureText: passwordVisible? false : true,
//       validator: (value) {
//         if (widget.errorText!.contains('Email')) {
//           if (value.toString().isEmpty || !value.toString().contains('@')) {
//             return '${widget.errorText}';
//           } else {
//             validate = true;
//           }
//         } else if (value == null || value.isEmpty) {
//           return '${widget.errorText}';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//           contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
//           prefixIcon: widget.prefixIcon,
//           suffixIcon: widget.textEditingController!.text.isNotEmpty?IconButton(
//             icon:passwordVisible
//                 ? const Icon(Icons.visibility_outlined)
//                 : const Icon(Icons.visibility_off_outlined),
//             onPressed: () {
//               setState(() {
//                 passwordVisible=!passwordVisible;
//               });
//             },
//           ):const Icon(Icons.visibility_off_outlined),
//           hintText: widget.hintText,
//           hintStyle: const TextStyle(
//               fontSize: 13, color: Colors.grey, fontWeight: FontWeight.normal),
//           fillColor: widget.fillColor,
//           filled: true,
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(30),
//             // borderSide: const BorderSide(color: Colors.black12)
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

class PasswordTextFormFieldData extends StatelessWidget {
  Icon? prefixIcon;
  Color? fillColor;
  double? withOpacity;
  String? hintText;
  String? onChange;
  final String? errorText;
  final GlobalKey? formKey;
  final TextEditingController? textEditingController;

  PasswordTextFormFieldData(
      {super.key,
      this.prefixIcon,
      this.fillColor,
      this.withOpacity,
      this.hintText,
      this.formKey,
      this.textEditingController,
      this.errorText});


  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProviderNotifier>(context);
    return TextFormField(
      key: formKey,
      controller: textEditingController,
      obscureText: providerData.showPassword ? false : true,
      validator: (value) {
        if (value.toString().isEmpty){
          return '$errorText';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          prefixIcon: prefixIcon,
          suffixIcon: textEditingController!.text.isNotEmpty
              ? IconButton(
                  icon: providerData.showPassword
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                  onPressed: () {
                    providerData.passwordShow();
                  },
                )
              : const Icon(Icons.visibility_off_outlined),
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
