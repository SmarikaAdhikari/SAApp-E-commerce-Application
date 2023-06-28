import 'package:flutter/material.dart';

Widget listswidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      // height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.blue[100],
      ),
      child: Column(
        children: [
          Image.asset("pics/north.jpeg", height: 60, width: 110),
          const Text("GENREw"),
          const Text("GENREw"),
          const Text("GENREw"),
        ],
      ),
    ),
  );
}
