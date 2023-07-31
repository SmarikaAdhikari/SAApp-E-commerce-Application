// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:app/api_all/api_book/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../Views/bookdetails.dart';
import '../api_all/api_book/api_provider.dart';

Widget favouriteWidget(
FavModel data,
  String id,
 WidgetRef ref,

) {
  return InkWell(
    onTap: () {
      ref.read(favBookFutureProvider.notifier).update((state) => data.id);
      Get.to(() => BookDetails(
        id: data.book.id,
            // data: data,
          ));
    },


    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          data.book.image ==  null 
         ? Image.asset(
                    "pics/daisy.jpeg",
                    height: 120,
                    width: 100,
                  ):
        
          Image.memory(base64Decode(data.book.image.toString()),
                    height: 120,width: 100,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.book.title),
              Text(data.book.author.name),
            
            ],
          ),
        ],
      ),
    ),
  );
}
