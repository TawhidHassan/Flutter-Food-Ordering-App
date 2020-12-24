import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering_app/model/category_model.dart';
import 'package:flutter_food_ordering_app/model/feather_model.dart';


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


  List<FeaturedModel> featureModelList=[];
  FeaturedModel featuredModel;

  Future<void> getFeatureProduct()async{
    List<FeaturedModel> list=[];
    QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.collection("homefeaturefood").get();
    querySnapshot.docs.forEach((featureData) {
      featuredModel=FeaturedModel(
          foodImage: featureData.data()["image"],
          foodtitle:  featureData.data()["foodTitle"],
          foodSubtitle: featureData.data()["foodSubtitle"],
          pricex: featureData.data()["price"],
          rating: featureData.data()["rating"],
      );
      list.add(featuredModel);
    });
    featureModelList=list;
    notifyListeners();
  }

  List<FeaturedModel>get getFeatureModelList{
    return featureModelList;
  }

}