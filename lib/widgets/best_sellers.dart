import 'package:app/api_all/api_book/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

Widget bestSellers(
    BookModel data, String id, WidgetRef ref, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    child: InkWell(
      onTap: () {
        
        Get.toNamed("/bookdetails", arguments: {"id": id});
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: Column(
            children: [
              data.image == null
                  ? Image.asset(
                      "pics/daisy.jpeg",
                      height: 120,
                      // width: 120,
                    )
                  : CachedNetworkImage(
                      imageUrl: data.image,
                      height: 120,
                      // fit:BoxFit.fitWidth,
                      width: 120,
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    ),
                    Text("Rs ${data.price.toString()}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
