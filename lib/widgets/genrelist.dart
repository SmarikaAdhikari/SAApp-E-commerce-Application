import 'package:app/Views/Buynow.dart';
// import 'package:app/Views/bookdetails.dart';
// import 'package:app/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget GenreList(
    //  Books data,
    ) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset("pics/north.jpeg", height: 100, width: 100),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("name"),
                Text("author"),
                Text("price"),
              ],
            ),
          ],
        ),
       
        Row(
              children: [
              //  const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: (){
                    Get.to(() => Pagethree());
                  },
                 child: const Row(
                   children: [
                     Text("Add to Cart"),
                     Icon(Icons.add_shopping_cart)
                   ],
                 )),
                  const SizedBox(width: 20,),
                 ElevatedButton(onPressed: (){
                  Get.to(() => Pagethree());
                 },
                 child: const Row(
                   children: [
                     Text("Buy Now"),
                     Icon(Icons.bookmark)
                   ],
                 )),
              ],
            ),
        
      ],
    ),
  );
}
