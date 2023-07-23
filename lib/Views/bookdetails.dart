// ignore_for_file: must_be_immutable, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:app/Views/Buynow.dart';
import 'package:app/api_all/api_book/api_model.dart';
import 'package:app/api_all/api_book/api_provider.dart';
// import 'package:app/pages/favoritepage.dart';
import 'package:app/widgets/listswidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// import '../provider/icon_color.dart';
import '../widgets/author.dart';
// import '../widgets/constants.dart';

class Pageone extends ConsumerStatefulWidget {
   Pageone({super.key, required this.data});
  Books data;
 
  @override
  ConsumerState<Pageone> createState() => _PageoneState();
}

class _PageoneState extends ConsumerState<Pageone> {
  @override
  Widget build(BuildContext context) {
    final FutureProvider = ref.watch(suggestionFutureProvider);
 
    // final List<String> items = List<String>.generate(5, (i) => '$i');
    return Scaffold(
      appBar: AppBar(
      
      
        actions: [

          IconButton(
            icon: const Icon(
              Icons.star_border_outlined,
           
            ),
            onPressed: () {
              
            },
          ),
        

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(children: [
                widget.data.image == null
                ?Image.asset(
                  'view/kitabalaya.png',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 180,
                )
                : Image.memory(base64Decode(widget.data.image),
                  height: 120, width: 100),
                const SizedBox(
                  width: 50,
                ),
                // Spacer(),
                 const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
               ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.data.price,
                          style: const TextStyle(fontSize: 15)),
                      Text(
                        widget.data.author.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ]),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data.description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
          
            const Divider(
        color: Colors.grey,
        thickness: 1,
          ),
      
            // ignore: sized_box_for_whitespace
            Container(

              child: author(
                widget.data
              ),
            
            ),
            const Divider(
        color: Colors.grey,
        thickness: 1,
          ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
               const SizedBox(width: 50,),
                ElevatedButton(
                  onPressed: (){
                    Get.to(() => Pagethree());
                  },
                 child: const Row(
                   children: [
                     Text("Add to Cart"),
                     Icon(Icons.add_shopping_cart)
                   ],
                 )),
                  const SizedBox(width: 20,),
                 ElevatedButton(onPressed: (){
                  Get.to(() => Pagethree());
                 },
                 child: const Row(
                   children: [
                     Text("Buy Now"),
                     Icon(Icons.bookmark)
                   ],
                 )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You may also like",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            FutureProvider.when(
                data: (data) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(data.length, (index) {
                      return listswidget(
                        data[index],
                      );
                    }))),
                error: (Object error, StackTrace stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return const CircularProgressIndicator();
                }),
            const SizedBox(
              height: 10,
            ),
            
          ]),
        ),
      ),
    );
  }
}
// // ignore: dead_code
// Color _getRandomColor() {
//     const colors = Colors.primaries;
//     return colors[DateTime.now().millisecondsSinceEpoch % colors.length];

    
  

