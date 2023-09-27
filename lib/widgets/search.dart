import 'package:app/api_all/api_cart/api_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

Widget searchWidget(
  SearchModel data,
  String id,
  WidgetRef ref,
){
  return InkWell(
    onTap: () {
      
      Get.toNamed("/bookdetails", arguments: {"id": id});
    
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                data.image == null
                    ? Image.asset("pics/north.jpeg", height: 100, width: 100)
                    : CachedNetworkImage(
                        imageUrl: data.image.toString(),
                        height: 120,
                        width: 100,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title.toString()),
                    Text(data.price.toString()),
                    
                  ],
                ),
              ],
            ),
          ),
      ),
    ),
  );
}