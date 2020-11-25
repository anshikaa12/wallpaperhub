import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/categories.dart';
String ApiKey='563492ad6f9170000100000114e8f63683c9437c95cc7a4b9ee9fad9';
List<CategoriesModel> getCategory(){
  List<CategoriesModel> categories= new List();
  CategoriesModel categoriesModel= new CategoriesModel();
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/1144687/pexels-photo-1144687.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='Nature';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/247431/pexels-photo-247431.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='Wildlife';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/4543135/pexels-photo-4543135.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='StreetArt';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/4141962/pexels-photo-4141962.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='Cars';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/1408221/pexels-photo-1408221.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='flowers';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/430207/pexels-photo-430207.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='geometric';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
  //
  categoriesModel.imageUrl="https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categoryName='cartoons';
  categories.add(categoriesModel);
  categoriesModel=new CategoriesModel();
  //
return categories;

}