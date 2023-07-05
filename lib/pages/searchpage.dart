import 'package:app/widgets/genrewidget.dart';
import 'package:flutter/material.dart';

import '../widgets/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(40)),
        child: TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
              hintText: "what are you looking for?",
              hintStyle: TextStyle(color: Colors.black, fontSize: 18),
              border: InputBorder.none),
        ),
      ),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return genreWidget();
            },
            itemCount: 18,
          ),
        ),
      ),
    ]));
  }
}
