// import 'package:app/Views/page7.dart';
// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app/publisher/api/api_model.dart';
import 'package:app/user/Views/page9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget trial(
ApiModel data,
String userId,
String status,

String price,

ref,

) {
  bool _isCheckedValue1 = false;


  return InkWell(
    onTap: () => Get.to(
      const PageNine(),
      duration: const Duration(milliseconds: 700),
      transition: Transition.leftToRight,
    ),
    child:    Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text( data.price.toString(),  
              style: TextStyle(fontSize: 15),
            ),
             Text( "   --",  
              style: TextStyle(fontSize: 15),
            ),
       const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                //  Text(
                //   data.bookname,
                //   style: TextStyle(fontSize: 15),
                // ),
           
           
                
             const SizedBox(
                  height: 10,
                ),
           Text(
                 data.status,
                  style: TextStyle(fontSize: 15),
                ),
          const SizedBox(
                  height: 10,
                ),
           Text(
                data.price.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_sharp),
                      ),
                    ),
          ],
        ),
      ),
    ),
  );
}
// List<String> OrderStatus = [
//   "Order Placed",
//   "Order Confirmed",
//   "Order Shipping",
//   "Order Delivered",
//   "Order Cancelled",
// ];