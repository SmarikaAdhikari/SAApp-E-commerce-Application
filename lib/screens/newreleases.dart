import 'package:app/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../main.dart';
// import '../widgets/genrelist.dart';

class Newreleases extends StatefulWidget {
  const Newreleases({super.key});

  @override
  State<Newreleases> createState() => _NewreleasesState();
}

class _NewreleasesState extends State<Newreleases> {
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
                  child: drawerWidget(),
                ),
              );
            },
            itemCount: 15,
          ),
        ));
  }
}
