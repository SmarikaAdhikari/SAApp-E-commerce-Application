import 'dart:async';

import 'package:app/pages/profilepage.dart';
import 'package:app/widgets/bio.dart';
import 'package:app/widgets/new.dart';
import 'package:flutter/material.dart';

class Edits extends StatefulWidget {
  Edits({super.key});

  @override
  State<Edits> createState() => _EditsState();
}

class _EditsState extends State<Edits> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController bioEditingController = TextEditingController();

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
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: bioEditingController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                newcontroller.add(nameEditingController.text);
                biocontroller.add(bioEditingController.text);
              },
              child: const Text("Done"))
        ],
      )),
    );
  }
}
