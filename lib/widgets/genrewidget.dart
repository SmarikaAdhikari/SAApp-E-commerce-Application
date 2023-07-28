import 'package:app/Views/enumlist.dart';
import 'package:app/api_all/api_genre/api_provider.dart';
// import 'package:app/pages/searchpage.dart';
// import 'package:app/api/api_model.dart';
// import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// import '../pages/searchpage.dart';

Widget genreWidget(String name,
int index,
WidgetRef ref


    ) {
  return InkWell(
    onTap: () {
      ref.read(genreStateProvider.notifier).update((state) => index);
      Get.to(() => 
      const EnumList(          
          )
          );
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
          color:const Color.fromARGB(255, 194, 220, 241),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "pics/north.jpeg",
              fit: BoxFit.cover, height: 90, width:140,
            ),
            const SizedBox(height:10),
           Text( name,
                style: const TextStyle(
                  
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ],
        )),
  );
}

