import 'dart:convert';

import 'package:app/Views/bookdetails.dart';
import 'package:app/api_all/api_book/api_provider.dart';
import 'package:app/api_all/api_book/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';


Widget bestSellers(
  BookModel data,
  String id,
  WidgetRef ref,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
    child: TextButton(
      onPressed: () {
        ref.read(bookByIdStateProvider.notifier).update((state) => data.id);
        Get.to(() => BookDetails(
            
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
            
            Text(
              data.title,
            ),
          
            Text(data.price.toString()),
          ],
        ),
      ),
    ),
  );
}
