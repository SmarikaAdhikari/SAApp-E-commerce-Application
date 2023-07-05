// import 'package:app/main.dart';
// import 'package:app/pages/profilepage.dart';
import 'package:app/widgets/bio.dart';
import 'package:app/widgets/date.dart';
import 'package:app/widgets/new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edits extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Edits({super.key});

  @override
  State<Edits> createState() => _EditsState();
}

class _EditsState extends State<Edits> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController bioEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: nameEditingController,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: bioEditingController,
              decoration: const InputDecoration(
                hintText: "Bio",
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: dateEditingController,
              decoration: const InputDecoration(
                hintText: "Date?",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              newcontroller.add(nameEditingController.text);
              biocontroller.add(bioEditingController.text);
              datecontroller.add(dateEditingController.text);
              Get.back();
            },
            child: const Text("Done"),
          ),
        ],
      )),
    );
  }
}
