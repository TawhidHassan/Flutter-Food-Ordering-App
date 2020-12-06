import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  Widget button({@required String name,Color color,Color textColor}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          side: BorderSide(color:Colors.green,width: 2 )
        ),
        color: color,
        child: Text(name,style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 22
        ),),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/food.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to tastee",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                  ),
                  Column(
                    children: [
                      Text("order food from our restaurent and",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey
                        ),
                      ),
                      Text("make reservetion in real time",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey
                        ),
                      ),
                    ],
                  ),
                  button(name: "Login",color: Colors.green,textColor: Colors.white),
                  button(name: "Signup",color: Colors.white,textColor:Colors.green ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

