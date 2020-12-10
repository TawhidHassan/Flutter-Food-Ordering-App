import 'package:flutter/material.dart';

class MyPasswordFiled extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  MyPasswordFiled({Key key, this.title,this.controller}) : super(key: key);

  @override
  _MyPasswordFiledState createState() => _MyPasswordFiledState();
}

class _MyPasswordFiledState extends State<MyPasswordFiled> {
  @override
  Widget build(BuildContext context) {
    bool obscureText=true;
    return TextFormField(
      controller:widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(

        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              obscureText=!obscureText;
            });
          },
            child: Icon(
              obscureText==true? Icons.visibility:Icons.visibility_off,
            )
        ),
          fillColor: Color(0xfff5d8e4),
          filled: true,
          hintText: widget.title,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
  }
}
