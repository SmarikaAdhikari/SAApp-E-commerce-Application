import 'package:app/Views/bookdetails.dart';
import 'package:app/widgets/constants.dart';
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
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: mainColor,
        ),
        child: Column(
          children: [
            Image.asset("pics/north.jpeg", height: 60, width: 110),
            Text(
              data.title,
            ),
            Text(data.author),
            Text(data.price.toString()),
          ],
        ),
      ),
    ),
  );
}
