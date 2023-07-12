import 'package:flutter/material.dart';

Widget author() {
  return const Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("pics/daisy.jpeg"),
      ),
      SizedBox(
        width: 20,
      ),
      Column(
        children: [
          Text(
            "Author Name",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Text(
            "Author Bio",
            style: TextStyle(fontSize: 10),
          ),
          Text(
            "Author Best Sellers",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    ],
  );
}
