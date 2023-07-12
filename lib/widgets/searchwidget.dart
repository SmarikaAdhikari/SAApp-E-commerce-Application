import 'package:app/Views/bookdetails.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchWidget() {
  return TextButton(
    onPressed: () {
      Get.to(() => const Pageone());
    },
    child: Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: mainColor,
      ),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            "pics/north.jpeg",
            fit: BoxFit.cover,
          )),
          const Column(
            children: [
              Text("Book Name"),
              Text("Author Name"),
              Text("\$ 1000"),
            ],
          ),
        ],
      ),
    ),
  );
}
