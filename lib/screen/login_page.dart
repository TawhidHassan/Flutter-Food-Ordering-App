
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email=TextEditingController();

  final TextEditingController password=TextEditingController();

  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation(BuildContext context){
    if(email.text.isEmpty&&password.text.isEmpty){
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill the filed"),
        )
      );
    }if(!regExp.hasMatch(email.text)){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("not validated email address"),
          )
      );
    }
    else if(email.text.isEmpty){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("email is empty"),
          )
      );
    }else if(password.text.isEmpty){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("password empty"),
          )
      );
    }else if(password.text.length<8){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("password to sort required 8 charcter"),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff8f8f8),
      body: Builder(
        builder: (BuildContext context){
          return SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login",style: TextStyle(
                            fontSize: 40,
                            color:Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("Welcome Back",style: TextStyle(
                          fontSize: 30,
                          color:Theme.of(context).primaryColor,
                        ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 300,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller:email,
                            decoration: InputDecoration(
                                fillColor: Color(0xfff5d8e4),
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Color(0xfff5d8e4),
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 69,
                    width: 400,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Text("Login",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      onPressed: (){
                        validation(context);
                      },
                    ),
                  ),
                  Container(
                    height: 69,
                    width: 400,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If you have not Account?",style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18
                        ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Text("Register",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ) ,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
