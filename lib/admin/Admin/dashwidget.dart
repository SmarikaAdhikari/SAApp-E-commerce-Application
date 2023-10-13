// import 'package:app/admin/api/api_model.dart';
import 'package:flutter/material.dart';

Widget dashy(
 IconData icon,
 String title,
 String data,

)
{
return Card(
  child:   Column(
    children: [
    const SizedBox(height: 10,),
       Icon(icon, size: 25, ),
      const SizedBox(height: 5,),
      Text(data),
       const SizedBox(height: 5,),
       Text(title, style: const TextStyle(fontSize: 11,fontWeight: FontWeight.bold)),
       const SizedBox(height: 5,),
    ],
  ),
);


}