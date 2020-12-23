import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/model/category_model.dart';


class Myprovider with ChangeNotifier{
  List<CategoryModel> categoryNodelList=[];
  CategoryModel categoryModel;

  Future<void> getCategoryProduct()async{
    List<CategoryModel> list=[];
    QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.collection("homecategory").get();
    querySnapshot.docs.forEach((categoryData) {
      categoryModel=CategoryModel(
      image: categoryData.data()["image"],
      name: categoryData.data()["name"]
      );
      list.add(categoryModel);
    });
    categoryNodelList=list;
    notifyListeners();
  }

  List<CategoryModel>get getCategoryModelList{
    return categoryNodelList;
  }

}