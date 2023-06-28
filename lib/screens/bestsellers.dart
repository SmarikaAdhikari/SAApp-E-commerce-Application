import 'package:flutter/material.dart';

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
        Navigator.pop(context);
      },
      child: Row(children: [
        Icon(Icons.arrow_back_ios),
        Text('Back to home page'),
      ]),
    ));
  }
}
