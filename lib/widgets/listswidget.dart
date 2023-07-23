import 'dart:convert';

import 'package:app/Views/bookdetails.dart';
// import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api_model.dart';

Widget listswidget(
  Books data,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
    child: TextButton(
      onPressed: () {
        Get.to(() => Pageone(
              data: data,
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            data.image == null
                ? Image.asset(
                    "pics/daisy.jpeg",
                    height: 120,
                    width: 100,
                  )
                : Image.memory(base64Decode(data.image.toString()),
                    height: 120, width: 100),
            // Image.asset("pics/north.jpeg", height: 60, width: 110),
            Text(
              data.title,
            ),
            // Text(data.author),
            Text(data.price.toString()),
          ],
        ),
      ),
    ),
  );
}
