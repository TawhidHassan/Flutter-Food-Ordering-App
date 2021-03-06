import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/provider/myProvider.dart';
import 'package:flutter_food_ordering_app/screen/login_page.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'contact.dart';
class HomePage extends StatelessWidget {

  Myprovider myprovider;

  Widget _buildSingleFeature({
    context,
    String foodTitle,
    String image,
    foodSubTitle,
    String rating,
    String price,
  }) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 230,
            width: 210,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  foodTitle,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                Text(
                  foodSubTitle,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$rating Ratings",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$$price",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        CircleAvatar(
          maxRadius: 60,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(image),
        ),
      ],
    );
  }



  Widget _buildSingleCategory({String image, String name}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 180,
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
                        image: NetworkImage(image),
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

  Widget _buildTopPart(context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.sort,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
          Container(
              child: Column(
                children: [
                  Container(
                    height:90,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius:30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            maxRadius: 25,
                            backgroundImage:
                            AssetImage("images/profileimage.jpg"),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 180,
                          child: ListTile(
                            title: Text(
                              "Have you upset",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Stomach?",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildFeatureProduct(context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myprovider.featureModelList.length,
                      itemBuilder: (ctx,index)=> _buildSingleFeature(
                        context: context,
                        foodSubTitle: myprovider.getFeatureModelList[index].foodSubtitle,
                        foodTitle: myprovider.getFeatureModelList[index].foodtitle,
                        price: myprovider.getFeatureModelList[index].pricex.toString(),
                        rating: myprovider.getFeatureModelList[index].rating.toString(),
                        image: myprovider.getFeatureModelList[index].foodImage,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xfff2f3f4),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myprovider.categoryNodelList.length,
                    itemBuilder: (ctx,index)=> _buildSingleCategory(name: myprovider.getCategoryModelList[index].name, image: myprovider.getCategoryModelList[index].image),
                    ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  "see all",
                  style: TextStyle(
                    fontSize: 23,
                    color: Theme.of(context).accentColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildFeatureProduct(context),
        ],
      ),
    );
  }

  Widget _buildMyDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/profileimage.jpg"),
            ),
            accountName: Text("Sabir Bugti"),
            accountEmail: Text("Sabirbugti@gmail.com"),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("HomePage"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Contact(),
                ),
              );
            },
            leading: Icon(
              Icons.contact_phone,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => About(),
                ),
              );
            },
            leading: Icon(
              Icons.info,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("About Page"),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Order"),
          ),
          ListTile(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    myprovider=Provider.of<Myprovider>(context);
    myprovider.getCategoryProduct();
    myprovider.getFeatureProduct();
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildMyDrawer(context),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopPart(context),
            _buildBottomPart(context),
          ],
        ),
      ),
    );
  }
}