// ignore_for_file: file_names

import 'package:app/Views/buynow%20.dart';
import 'package:app/Views/page5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawerWidget(

) {
  return InkWell( 
    onTap: () =>
    Get.to(
    const TryPage(),
    duration: const Duration(seconds: 1),
    transition: Transition.leftToRight,
        ),
  
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Image.asset("pics/north.jpeg", height: 100, width: 100),
              const SizedBox(width: 10),
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
              onPressed: () {
                Get.to(() => const CartPage());
              },
              child: const Row(
                children: [
                  
    
                  Spacer(),
    
                  Text("Add to Cart"),
    
                  Icon(Icons.add_shopping_cart)
                ],
              )),
        ],
      ),
    ),
  );
}
