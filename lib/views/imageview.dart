import 'dart:html';
import 'dart:js';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: camel_case_types
class imageView extends StatefulWidget {
 final String imgURL;
 imageView({this.imgURL});

  @override
  _imageViewState createState() => _imageViewState();
}

// ignore: camel_case_types
class _imageViewState extends State<imageView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children:[ Hero(
          tag: widget.imgURL,
          child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgURL,fit: BoxFit.cover,)),
        ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(

                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0x36FFFFFF),
                          Color(0x0FFFFFFF),
                          Colors.black26,
                        ]
                      )),

                    child: Column(
                      children: [
                        Text('Set Wallpaper',style: TextStyle(
                          fontSize: 18,color: Colors.white70
                        ),),
                        Text('Image will be saved in gallery',style: TextStyle(
                          fontSize: 12,color: Colors.white70
                        ),),
                      ],
                    ),
                  ),
SizedBox(height: 16,)              ,
                  Text('CANCEL',style: TextStyle(color: Colors.white)
                    ,),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          )
      ]),
      );

  }
}
