import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Newreleases extends StatefulWidget {
  const Newreleases({super.key});

  @override
  State<Newreleases> createState() => _NewreleasesState();
}

class _NewreleasesState extends State<Newreleases> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ElevatedButton(
        onPressed: () {
          Get.off(MyHomePage());
        },
        child: Text('Go back!'),
      ),
    );
  }
}
