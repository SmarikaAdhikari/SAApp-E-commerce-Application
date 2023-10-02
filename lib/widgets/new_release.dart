// import 'package:app/Views/bookdetails.dart';
// import 'package:app/Views/bookdetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../api_all/api_book/book_model.dart';
// import 'package:get/get.dart';

Widget newRelease(
  BookModel data,
  String id,
  WidgetRef ref,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    child: InkWell(
      onTap: () {

        Get.toNamed("/bookdetails", arguments: {"id": id});
        // Get.to(() => BookDetails(
        //       id: data.id,

        //       // data: data,
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(60, 0, 0, 0),
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:2.0),
          child: Column(
            children: [
              data.image == null
                  ? Image.asset(
                      "pics/daisy.jpeg",
                      height: 120,
                    )
                  : CachedNetworkImage(
                      imageUrl: data.image,
                      height: 120,
                    ),
              Column(
                children: [
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(data.author),
                  Text("Rs ${data.price.toString()}"),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
