import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/provider/myProvider.dart';
import 'package:flutter_food_ordering_app/screen/detail_screen.dart';
import 'package:flutter_food_ordering_app/screen/homePage.dart';
import 'package:flutter_food_ordering_app/screen/login_page.dart';
import 'package:flutter_food_ordering_app/screen/profile.dart';
import 'package:flutter_food_ordering_app/screen/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Myprovider>(
      create: (ctx)=>Myprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FOOD Ordering',
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
        ),
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
            if(snapshot.hasData){
              return HomePage();
            }else{
              return Login();
            }

            },

        ),
      ),
    );
  }
}
