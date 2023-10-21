import 'package:flutter/material.dart';

String home = "/home";
String data = "/data";
String details = "/details";
Color primaryColor = Colors.blue;

TextFormField buildTextFormField(
  TextEditingController nameController,
  TextInputType type,
    int length,
    String text,
    String validatorText,
) {
  return TextFormField(
    textDirection: TextDirection.rtl,
    controller: nameController,
    keyboardType: type,
    maxLength: length,
    decoration: InputDecoration(
      //suffix: Icon(Icons.person),
      label: Text(
        text,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 18, color: Color(0xFF48907E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF48907E),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF48907E), width: 2.0),
          borderRadius: BorderRadius.circular(15)),
    ),
    validator: (val) {
      if (nameController.text.isEmpty) {
        return validatorText;
      }
    },
  );
}
