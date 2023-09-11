import 'package:flutter/material.dart';

Widget trial()
{
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child:  Card(
    
      child: Row(children: [
        SizedBox(width: 10,),
        Image(image: AssetImage("pics/north.jpeg"),height: 100,width: 100,),
        SizedBox(width: 10,), 
         Text("Trial",style: TextStyle(fontSize: 30),),
          SizedBox(width: 100,),
          Text("500",style: TextStyle(fontSize: 30),),
         
      
      
      
      ],),
    ),
  );
    }