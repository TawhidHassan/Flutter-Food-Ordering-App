import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

   MyTextFormField({Key key, this.title,this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      decoration: InputDecoration(
          fillColor: Color(0xfff5d8e4),
          filled: true,
          hintText: title,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
  }
}
