import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  //step1 ---->  here I will Create class variables :
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final int? maxLines;
  final TextInputType? textInputType;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.maxLines,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
