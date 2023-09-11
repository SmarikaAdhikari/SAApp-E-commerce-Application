
import 'package:app/widgets/drawerWidget.dart';
// ignore: unused_import
import 'package:app/widgets/trial.dart';
import 'package:flutter/material.dart';


class Popularauthors extends StatefulWidget {
  const Popularauthors({super.key});

  @override
  State<Popularauthors> createState() => _PopularauthorsState();
}

class _PopularauthorsState extends State<Popularauthors> {
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
        ));
  }
}
