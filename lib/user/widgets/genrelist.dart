// import 'package:app/Views/Buynow.dart';
// import 'package:app/Views/page8.dart';
import 'package:app/user/api_all/api_genre/api_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:app/Views/bookdetails.dart';
// import 'package:app/api/api_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget  GenreList(
  EnumModel data,
) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
    ),
    child: InkWell(
      onTap: () {
        Get.toNamed("/bookdetails", arguments: {"id": data.id});
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,bottom:8),
        child: Column(
          children: [
            Row(
              children: [
                data.image == null
                    ? Image.asset("pics/north.jpeg", height: 100, width: 100)
                    : CachedNetworkImage(
                        imageUrl: data.image.toString(), height: 120, width: 100),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title),
                    Text(data.author.name),
                    Text("Rs ${data.price.toString()}"),
                  ],
                ),
              ],
            ),
            // TextButton(
            //     onPressed: () {
            //       Get.to(() => BuyNow());
            //     },
            //     child: const Row(
            //       children: [
            //         // SizedBox(width: 70),
            //         Spacer(),
            //         Text("Add to Cart"),
            //         Icon(Icons.add_shopping_cart)
            //       ],
            //     )),
          ],
        ),
      ),
    ),
  );
}
