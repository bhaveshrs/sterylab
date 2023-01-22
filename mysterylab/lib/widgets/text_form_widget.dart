import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget(
      {super.key,
      required this.controller,
      this.textInputType,
      this.hinttext,
      this.obscuretext,
      this.waring,
      this.pading});
  TextEditingController controller;
  String? hinttext;
  String? waring;
  bool? obscuretext;
  TextInputType? textInputType;
  EdgeInsetsGeometry? pading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          pading ?? const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: TextFormField(
        obscureText: obscuretext ?? false,
        controller: controller,
keyboardType:textInputType ??TextInputType.emailAddress,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.white)),
            contentPadding: const EdgeInsets.all(20),
            hintText: hinttext,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 18),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.white)),
            fillColor: AppColors.white,
            filled: true),

        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return waring ?? "";
          }
          return null;
        },
      ),
    );
  }
}
