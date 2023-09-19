// import 'package:app/Views/page7.dart';
import 'package:app/Views/page9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget trial()
{
  return InkWell(

    onTap: () =>  Get.to( const PageNine(),
    duration: const Duration(milliseconds: 700),
    transition: Transition.leftToRight,),
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child:  Card(
      
        child: Row(children: [
          SizedBox(width: 10,),
          Image(image: AssetImage("pics/north.jpeg"),height: 50,width: 50,),
          SizedBox(width: 10,), 
           Text("Trial",style: TextStyle(fontSize: 15),),
            SizedBox(width: 100,),
            Text("500",style: TextStyle(fontSize: 15),),
           
        
        
        
        ],),
      ),
    ),
  );
    }