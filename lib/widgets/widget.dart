import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/imageview.dart';

Widget BrandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Wallpaper',style: TextStyle(color: Colors.black87),),
    Text("Hub",style: TextStyle(color: Colors.blue),),
    ],
  );
}
Widget WallpaperList({List <wallPaperModel> wallpapers,context}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
child: GridView.count(crossAxisCount: 2,
  shrinkWrap: true,
  childAspectRatio: 0.6,
    physics: ClampingScrollPhysics(),
    mainAxisSpacing: 6,
    crossAxisSpacing: 6,
  children: wallpapers.map((wallpapers){
    return GridTile(
        child: GestureDetector(
           onTap: (){
    Navigator.push(context, MaterialPageRoute(
    builder: (context)=>imageView(imgURL: wallpapers.src.portrait,)
    ));
    },
          child: Hero(
tag: wallpapers.src.portrait,
            child: Container(

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpapers.src.portrait,fit: BoxFit.cover,)),


            ),
          ),
        )

    );
  }).toList(),
),
  );

}