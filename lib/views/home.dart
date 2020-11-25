import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/category.dart';
import 'package:wallpaper_app/views/imageview.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<CategoriesModel> categories= new List();
  List<wallPaperModel> Wallpapers=new List();
  TextEditingController searchcontroller= new TextEditingController();

  getTrendingWallpapers() async{
    var response= await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1",
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
    getTrendingWallpapers();
    categories= getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
               Container(
                 height: 80.0,
                 padding: EdgeInsets.symmetric(horizontal: 24),
                 child: ListView.builder(
                   itemCount: categories.length,
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index){
                     return categoryTitle(
                       title: categories[index].categoryName,
                       imageURL: categories[index].imageUrl,

                     );
                   },

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
      ),


    );
  }
}

class categoryTitle extends StatelessWidget {
  final String imageURL,title;
  categoryTitle({this.title,this.imageURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>category(categoryName: title.toLowerCase(),),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children:<Widget> [

               ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Image.network(imageURL,height: 50,width: 100,fit: BoxFit.cover,)),

            Container(
              color: Colors.black26,
              height: 50,width: 100,
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),),
            ),


          ],
        ),
      ),
    );
  }
}
