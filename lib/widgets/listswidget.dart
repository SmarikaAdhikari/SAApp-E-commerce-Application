import 'package:flutter/material.dart';

Widget listswidget() {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.blue[100],
    ),
    child: Column(
      children: [
        Image.asset("pics/north.jpeg", height: 80, width: 110),
        const Text("GENRE"),
      ],
    ),
  );
}
