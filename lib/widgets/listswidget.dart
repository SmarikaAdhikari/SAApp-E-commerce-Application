import 'package:app/Views/bookdetails.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget listswidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
    child: TextButton(
      onPressed: () {
        Get.to(() => const Pageone());
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: mainColor,
        ),
        child: Column(
          children: [
            Image.asset("pics/north.jpeg", height: 60, width: 110),
            const Text("Book name"),
            const Text("Author name"),
            const Text("\$ 1000"),
          ],
        ),
      ),
    ),
  );
}
