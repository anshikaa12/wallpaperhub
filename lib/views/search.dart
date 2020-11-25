import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;
class search extends StatefulWidget {
  final String searchquerry;
  search({this.searchquerry});
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  List<wallPaperModel> Wallpapers=new List();

  TextEditingController searchcontroller= new TextEditingController();
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
    getSearchedWallpapers(widget.searchquerry);
    super.initState();
    searchcontroller.text=widget.searchquerry;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),

              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>search(

                        searchquerry: searchcontroller.text,),
                    ));
                  },
                  child: Container(child: Icon(Icons.search))),

            ],
          ),
        ),
            SizedBox(height: 16,),
            WallpaperList(
              wallpapers: Wallpapers,
              context: context,
            ),
            ],
          ),
        ),
   ] )),
      ));
  }
}
