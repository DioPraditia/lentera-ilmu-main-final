// ignore_for_file: file_names

import 'package:flutter/material.dart';

class genAlamatFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData iconData;
  TextInputType textInputType;

  // ignore: use_key_in_widget_constructors
  genAlamatFormField(
      {required this.controller,
      required this.hintName,
      required this.iconData,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hintName,
        labelText: "Masukkan $hintName",
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Masukkan $hintName";
        }
      },
    );
  }
}
