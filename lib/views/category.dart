import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;
class category extends StatefulWidget {
  final String categoryName;
  category({this.categoryName});
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<wallPaperModel> Wallpapers=new List();

  getSearchedWallpapers(String querry) async{
    var response= await http.get("https://api.pexels.com/v1/search?query=$querry&per_page=15&page=1",
        headers:{
          "Authorization": ApiKey,
        });
    // print(response.body.toString());
    Map <String,dynamic> jsonData= jsonDecode(response.body) ;
    jsonData['photos'].forEach((element){
      wallPaperModel wallparemodel= new wallPaperModel();
      wallparemodel=wallPaperModel.fromMap(element);
      Wallpapers.add(wallparemodel);
      // print(element.toString());
    });
    setState(() {

    });
  }
  @override
  void initState() {
    getSearchedWallpapers(widget.categoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [


                        WallpaperList(
                          wallpapers: Wallpapers,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ] )),
      ),
    );
  }
}
