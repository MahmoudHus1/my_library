import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  String hintText;
  TextEditingController controller;

  CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller}
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        floatingLabelStyle: const TextStyle(color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

