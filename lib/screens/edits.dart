import 'dart:async';

import 'package:app/pages/profilepage.dart';
import 'package:app/widgets/new.dart';
import 'package:flutter/material.dart';
// void main() {
//   runApp(Edits());
// }

class Edits extends StatefulWidget {
  Edits({super.key});

  @override
  State<Edits> createState() => _EditsState();
}

class _EditsState extends State<Edits> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // StreamBuilder<String>(
          //     stream: streamController.stream,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Text(
          //           snapshot.data.toString(),
          //           style: const TextStyle(
          //               fontWeight: FontWeight.bold, fontSize: 20),
          //         );
          //       } else {
          //         return const Text(
          //           "No Data",
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //         );
          //       }
          //     }),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: textEditingController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                newcontroller.add(textEditingController.text);
              },
              child: const Text("Done"))
        ],
      )),
    );
  }
}
