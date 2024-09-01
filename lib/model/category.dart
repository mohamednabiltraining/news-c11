import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/my_theme.dart';

class Category {
  String id;
  String title;
  String imgPath;
  Color color;
  Category(
      {required this.color,
      required this.id,
      required this.imgPath,
      required this.title});

       static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imgPath: 'assets/images/sports.png',
          color: MyTheme.redColor),
      Category(
          id: 'general',
          title: 'General',
          imgPath: 'assets/images/general.png',
          color: MyTheme.darkBlueColor),
      Category(
          id: 'health',
          title: 'Health',
          imgPath: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imgPath: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imgPath: 'assets/images/entertainment.png',
          color: MyTheme.blueColor),
      Category(
          id: 'science',
          title: 'Science',
          imgPath: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      Category(
          id: 'technology',
          title: 'Technology',
          imgPath: 'assets/images/technology.png',
          color: MyTheme.darkBlueColor),
    ];
  }

}
