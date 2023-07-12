import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../main.dart';
import '../widgets/genrelist.dart';

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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GenreList(),
                ),
              );
            },
            itemCount: 15,
          ),
        ));
  }
}
