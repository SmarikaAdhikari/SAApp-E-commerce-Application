import 'package:flutter/material.dart';

class Pagenine extends StatefulWidget {
  const Pagenine({super.key});

  @override
  State<Pagenine> createState() => _PagenineState();
}

class _PagenineState extends State<Pagenine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: Category.values.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  print(Category.values[index]);
                },
                title: Text(Category.values[index].toString().split(".")[1]),
              ),
            );
          },
        ));
  }
}

enum Category {
  horror,
  comedy,
  drama,
  action,
  adventure,
  fantasy,
  romance,
  mystery,
  thriller,
  crime,
  historical,
}
