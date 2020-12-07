import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/screen/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOOD Ordering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:,
    );
  }
}
