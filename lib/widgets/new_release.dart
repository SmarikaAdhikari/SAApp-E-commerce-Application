import 'dart:convert';

// import 'package:app/Views/bookdetails.dart';
import 'package:app/Views/bookdetails.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../api_all/api_book/api_provider.dart';
import '../api_all/api_book/book_model.dart';
// import 'package:get/get.dart';

Widget newRelease(
  BookModel data,
  String id,
  WidgetRef ref,
) {
  return TextButton(
    onPressed: () {
      ref.read(bookByIdStateProvider.notifier).update((state) => data.id);
      Get.to(() => BookDetails(
        
            // data: data,
          ));
    },
    child: Container(
      padding: const EdgeInsets.all(8 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: mainColor,
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
                    height: 120,width: 100,),
          Column(
            children: [
              Text(data.title, maxLines: 1, overflow: TextOverflow.ellipsis,),
              // Text(data.author),
              Text(data.price.toString()),
            ],
          ),
        ],
      ),
    ),
  );
}
