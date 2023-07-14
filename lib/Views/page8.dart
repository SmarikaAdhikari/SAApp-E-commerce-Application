// ignore_for_file: constant_identifier_names

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
                  // print(Category.values[index]);
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

enum Genre {
  Literary_Fiction,
  Contemporary_Romance,
  Crime_Thriller,
  Science_Fiction,
  Biography_or_Memoir,
  History_or_Geography,
  Young_Adult_Fiction,
  Childrens_Books,
  Fantasy,
  Horror,
  Science_or_Technology,
  Self_Help_or_Psychology,
  Humour,
  Food_or_Cookery,
  Art_or_Photography,
  Sports_or_Leisure,
  Travel,
  Religion_or_Spirituality,
  Politics_or_Current_Affairs,
  Popular_Science,
  Business_or_Economics,
  Health_or_Wellbeing,
  Parenting_or_Family,
  Education_or_Reference,
  Poetry_or_Plays,
  Comics_or_Graphic_Novels,
  Music_or_Film,
  Romance,
}
