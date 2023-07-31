import 'dart:convert';

import 'package:app/api_all/api_book/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget orderWidget(
CartModel data,
  String id,
 WidgetRef ref,

) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        data.kitab.image ==  null 
         ? Image.asset(
                    "pics/daisy.jpeg",
                    height: 120,
                    width: 100,
                  ):
        Image.memory(base64Decode(data.kitab.image.toString()),
                    height: 120,width: 100,),
        const SizedBox(width: 20),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.kitab.title),
            Text(data.kitab.price),
            
          ],
        ),
      ],
    ),
  );
}
