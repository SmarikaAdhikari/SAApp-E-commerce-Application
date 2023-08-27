
// import 'package:flutter/cupertino.dart';
// ignore_for_file: file_names

import 'package:app/Views/Buynow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawerWidget()
{
return Column(
  children: [
    Row(
      children: [
        Image.asset("pics/north.jpeg", height: 100, width: 100),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("The name:"),
            Text("The author name:"),
            Text("Ratings:"),
          ],
        ),
      ],
    ),
TextButton(
      onPressed: (){
        Get.to(() => BuyNow());
      },
     child: const Row(
       children: [
        // SizedBox(width: 70),
        Spacer(),
         Text("Add to Cart"),
         Icon(Icons.add_shopping_cart)
       ],
     )),
    
  ],
);



}