// import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bestsellers extends StatefulWidget {
  const Bestsellers({super.key});

  @override
  State<Bestsellers> createState() => _BestsellersState();
}

class _BestsellersState extends State<Bestsellers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Go back!'),
      ),
    );
  }
}
