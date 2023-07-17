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
        const SizedBox(
          width: 50,
        ),
        Row(
          children: [
            const Text(
              "Add to cart",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Get.to(() => Pagethree());
              },
              icon: const Icon(Icons.add),
            ),
            const Icon(Icons.shopping_cart_outlined),
          ],
        ),
      ],
    ),
  );
}
