import 'package:app/api/api_model.dart';
import 'package:flutter/material.dart';

Widget author(
  Books  data,
) {
  return  Padding(
    padding: const EdgeInsets.all(8),
    child:  Row(
      children: [
        Expanded(
          child: Column(
            children: [
            //  const   SizedBox(width: 40),
             const  Text(
                "Genre",
                style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                data.genre!,
                style:const  TextStyle(fontSize: 12),
              ),
             
            ],
          ),
        ),
         const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
               ),
        Expanded(
          child: Column(
            children: [
              const Text(
                "Publisher",
                style: TextStyle(fontSize: 13, color:Colors.black,fontWeight: FontWeight.bold),
              ),
              Text(
                data.publisher.name,
                style: const TextStyle(fontSize: 12),
              ),
             
            ],
          ),
        ),
         const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            const Text(
              "Released",
              style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              data.releasedate??'',
              style:const  TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            const Text(
              "Language",
              style: TextStyle(fontSize: 13,color:Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              data.language??'',style: const TextStyle(fontSize: 12),
            ),
           
          ],
        ),
         const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          children: [
            const Text(
              "Length",
              style: TextStyle(fontSize: 13, color:Colors.black,fontWeight: FontWeight.bold),
            ),
            Text(
              data.length??'',
              style:const  TextStyle(fontSize: 12),
            ),
           
          ],
        ),
        
      ],
    ),
  );
}
