import 'dart:convert';

import 'package:app/Views/bookdetails.dart';
import 'package:app/api/api_model.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchWidget(
  Books data,
) {
  return TextButton(
    onPressed: () {
      Get.to(() => Pageone(
            data: data,
          ));
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
          
            data.image == null
                ? Expanded(
                  child: Image.asset(
                      "pics/daisy.jpeg",
                      height: 60,
                      width: 110,
                    ),
                )
                : Expanded(
                  child: Image.memory(base64Decode(data.image.toString()),
                      height: 60, width: 110),
                ),
          // Expanded(
          //     child: Image.asset(
          //   "pics/north.jpeg",
          //   fit: BoxFit.cover,
          // )),
          Column(
            children: [
              Text(data.title),
              // Text(data.author),
              Text(data.price.toString()),
            ],
          ),
        ],
      ),
    ),
  );
}
