import 'package:flutter/material.dart';

Widget author() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child:  Row(
      children: [
        Column(
          children: [
             SizedBox(width: 40),
            Text(
              "Genre",
              style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              " Name",
              style: TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Publisher Info",
              style: TextStyle(fontSize: 13, color:Colors.black,fontWeight: FontWeight.bold),
            ),
            Text(
              " Name",
              style: TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Released",
              style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              " Date",
              style: TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Language",
              style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              " Name",
              style: TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Length",
              style: TextStyle(fontSize: 13, color:Colors.black,fontWeight: FontWeight.bold),
            ),
            Text(
              "Pages",
              style: TextStyle(fontSize: 12),
            ),
           
          ],
        ),
        
      ],
    ),
  );
}
