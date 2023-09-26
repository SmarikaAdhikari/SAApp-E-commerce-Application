import 'package:flutter/material.dart';

import '../widgets/drawerWidget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: drawerWidget(),
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
