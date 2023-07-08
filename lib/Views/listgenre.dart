import 'package:app/widgets/genrelist.dart';
// import 'package:app/widgets/genrewidget.dart';
import 'package:flutter/material.dart';

// import '../widgets/favouritewidget.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
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
      ),
    );
  }
}
