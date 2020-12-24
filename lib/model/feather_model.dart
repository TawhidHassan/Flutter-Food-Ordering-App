import 'package:flutter/material.dart';

class FeaturedModel{
  final String foodImage;
  final String foodtitle;
  final String foodSubtitle;
  final double pricex,rating;

  FeaturedModel(
      {
        @required this.foodImage,
        @required this.foodtitle,
        @required this.foodSubtitle,
        @required this.pricex,
        @required this.rating});


}