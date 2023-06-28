import 'package:flutter/material.dart';

class Popularauthors extends StatefulWidget {
  const Popularauthors({super.key});

  @override
  State<Popularauthors> createState() => _PopularauthorsState();
}

class _PopularauthorsState extends State<Popularauthors> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: Text("Popular Authors"),
    ));
  }
}
