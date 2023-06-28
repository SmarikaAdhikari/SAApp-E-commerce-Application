import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Popularauthors extends StatefulWidget {
  const Popularauthors({super.key});

  @override
  State<Popularauthors> createState() => _PopularauthorsState();
}

class _PopularauthorsState extends State<Popularauthors> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ElevatedButton(
        onPressed: () {
          Get.off((MyHomePage()));
        },
        child: Text('Go back!'),
      ),
    );
  }
}
