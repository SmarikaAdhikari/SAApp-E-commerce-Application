// import 'package:app/publisher/trial.dart';
import 'package:flutter/material.dart';

class Pageseven extends StatefulWidget {
  const Pageseven({super.key});

  @override
  State<Pageseven> createState() => _PagesevenState();
}

class _PagesevenState extends State<Pageseven> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(),
        body : ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return  const Card();
       } ),),
    );
    }
  }

