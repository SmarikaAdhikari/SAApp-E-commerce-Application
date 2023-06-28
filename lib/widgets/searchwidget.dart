import 'package:flutter/material.dart';

Widget searchWidget() {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    // height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.blue[100],
    ),
    child: Column(
      children: [
        Image.asset("pics/north.jpeg", height: 80, width: 140),
        const Text("GENRE"),
      ],
    ),
  );
}
