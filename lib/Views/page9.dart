// import 'package:app/Views/page7.dart';
// import 'package:app/Views/page8.dart';
// import 'package:app/widgets/trial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNine extends StatefulWidget {
  const PageNine({super.key});

  @override
  State<PageNine> createState() => _PageNineState();
}

class _PageNineState extends State<PageNine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 

        Center(
          child: ElevatedButton(onPressed: () {
            Get.toNamed("/page7");
          }, child: const Text("Page seven")),
        ),
    );}
}