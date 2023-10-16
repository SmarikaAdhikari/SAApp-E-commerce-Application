import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class Trio extends StatefulWidget {
  const Trio({super.key});

  @override
  State<Trio> createState() => _TrioState();

  // static Future<Trio> fromJson(data) {}
}

class _TrioState extends State<Trio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: const Text('Trio'),
),
body:
ElevatedButton(onPressed: (){
    final snackBar = SnackBar(
                            content: const Text('Yay! A SnackBar!'),
                            action: SnackBarAction(
                              label: 'Incorrect',
                              onPressed: () {},
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // Get.back();
}, child:const  Text("trio")),
    );
  }
}