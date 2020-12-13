import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/screen/login_page.dart';

class HomePage extends StatelessWidget {
  Widget _buildSingleCategory({String image, String name}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 160,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/$image.png"),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: IconButton(
                              icon: Icon(Icons.sort,size: 45,color: Colors.white,),
                              onPressed: () {
                                FirebaseAuth.instance.signOut();

                              },
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.notifications,size: 30,color: Colors.white,),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();

                                },
                              ),IconButton(
                                icon: Icon(Icons.logout,size: 30,color: Colors.white,),
                                onPressed: () async{
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => Login(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                             Container(
                               height: 120,
                               padding:EdgeInsets.symmetric(horizontal: 20) ,
                               child: Row(
                                 children: [
                                   CircleAvatar(
                                     maxRadius: 45,
                                     backgroundColor: Colors.white,
                                     child: CircleAvatar(
                                       radius: 40,
                                       backgroundImage: AssetImage("images/profileimage.jpg"),
                                     ),
                                   ),
                                   Container(
                                     height: 80,
                                     width: 180,
                                     child: ListTile(
                                       title:Text("Have you upset",style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 21,
                                         color: Colors.white
                                       ),
                                       ),
                                       subtitle:Text("Stomach?",style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.white
                                       ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xfff2f3f4),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: 240,
                              child: Row(
                                children: [
                                  _buildSingleCategory(name: "Pizza", image: "pizza"),
                                  _buildSingleCategory(name: "Salad", image: "salad"),
                                  _buildSingleCategory(name: "Bargar", image: "bargar"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
