// ignore_for_file: unnecessary_null_comparison

import 'package:app/api_all/api_book/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// import '../Views/bookdetails.dart';
import '../api_all/api_book/api_provider.dart';

Widget favouriteWidget(
  FavModel data,
  String id,
  WidgetRef ref,
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      ref.read(favBookFutureProvider.notifier).update((state) => data.id);
     
      Get.toNamed("/bookdetails", arguments: {"id": id});
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          data.book.image == null
              ? Image.asset("pics/north.jpeg", height: 100, width: 100)
              : CachedNetworkImage(
                  imageUrl: data.book.image.toString(),
                  height: 120,
                  width: 100,
                ),
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
