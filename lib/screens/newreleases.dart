import 'package:flutter/material.dart';

class Newreleases extends StatefulWidget {
  const Newreleases({super.key});

  @override
  State<Newreleases> createState() => _NewreleasesState();
}

class _NewreleasesState extends State<Newreleases> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: Text("New Releases"),
    ));
  }
}
