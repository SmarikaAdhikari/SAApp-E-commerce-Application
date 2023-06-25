import 'package:flutter/material.dart';
Widget searchWidget()
{
  return Container(
    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
    height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.green[300],
    ),

    child: Column(
      children: [
      Image.asset("pics/north.jpeg",height:80,width:140),
      Text("GENRE"),
    ],),
  );
}