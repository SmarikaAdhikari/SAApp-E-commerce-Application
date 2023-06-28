import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trendingscreen extends StatefulWidget {
  const Trendingscreen({super.key});

  @override
  State<Trendingscreen> createState() => _TrendingscreenState();
}

class _TrendingscreenState extends State<Trendingscreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ElevatedButton(
        onPressed: () {
          Get.off(const MyHomePage());
        },
        child: const Text('Go back!'),
      ),
      //     child: Center(
      //   child: Text("Trending"),
      // )
    );
  }
}
