import 'package:app/Views/listgenre.dart';
// import 'package:app/pages/searchpage.dart';
// import 'package:app/api/api_model.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../pages/searchpage.dart';

Widget genreWidget(String name,
// Books data,
// Genre name,

    ) {
  return TextButton(
    onPressed: () {
      Get.to(() => const Pagetwo(
          
          ));
    },
    child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          // bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: mainColor,
        ),
        child: Column(
          children: [
            Image.asset(
              "pics/north.jpeg",
              fit: BoxFit.cover, height: 80, width:120,
            ),
            const SizedBox(height:10),
         Expanded(
           child: Text( name,
                  style: const TextStyle(
                    
                    fontWeight: FontWeight.bold,
                  )),
         ),
          ],
        )),
  );
}

