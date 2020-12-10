import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/widget/MyPasswordTextFiled.dart';
import 'package:flutter_food_ordering_app/widget/MyTextFormField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  final TextEditingController email=TextEditingController();
  final TextEditingController name=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController address=TextEditingController();
  final TextEditingController gender=TextEditingController();

  final TextEditingController password=TextEditingController();

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
    }else if(name.text.isEmpty){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Naame is empty"),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height:100,
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Registration",style: TextStyle(
                            fontSize: 35,
                            color:Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("Welcome sir",style: TextStyle(
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
                      height: 450,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         MyTextFormField(title: "Email",controller: email,),
                          SizedBox(height: 10,),
                          MyTextFormField(title: "Name",controller: name,),
                          SizedBox(height: 10,),
                          MyTextFormField(title: "Phone number",controller: phone,),
                          SizedBox(height: 10,),
                          MyTextFormField(title: "Address",controller: address,),
                          SizedBox(height: 10,),
                          MyTextFormField(title: "Gender",controller: gender,),
                          SizedBox(height: 10,),
                          MyPasswordFiled(title: "Password",controller: password,),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 59,
                    width: 400,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Text("Register",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      onPressed: (){
                        validation(context);
                      },
                    ),
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
