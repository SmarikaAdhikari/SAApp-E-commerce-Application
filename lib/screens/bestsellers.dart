// import 'package:app/main.dart';
import 'package:app/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../widgets/genrelist.dart';

class Bestsellers extends StatefulWidget {
  const Bestsellers({super.key});

  @override
  State<Bestsellers> createState() => _BestsellersState();
}

class _BestsellersState extends State<Bestsellers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return  Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: 
                  drawerWidget(),
                ),
              );
            },
            itemCount: 15,
          ),
        ));

    // return Drawer(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       Get.back();
    //     },
    //     child: const Text('Go back!'),
    //   ),
    // );
  }
}
