import 'package:flutter/material.dart';

Widget orderWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Image.asset("pics/north.jpeg", height: 100, width: 100),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("The name:"),
            Text("Rs 1000"),
            Text("Shipping Address:"),
          ],
        ),
      ],
    ),
  );
}
