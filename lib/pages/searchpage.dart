// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:app/widgets/genrewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/constants.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
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
              childAspectRatio: 2.3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return genreWidget(
                Genres[index].toString(),
                index,
               ref

              );
          },
            itemCount: Genres.length,
          ),
        ),
      ),
    ]));
  }
}

List<String> Genres = [
  'Literary Fiction',
  'Contemporary Romance',
  'Crime Thriller',
  'Science Fiction',
  'Biography / Memoir',
  'History / Geography',
  'Young Adult Fiction',
  'Childrens Books',
  'Fantasy',
  'Horror',
  'Science / Technology',
  'Self Help / Psychology',
  'Humour',
  'Food / Cookery',
  'Art / Photography',
  'Sports / Leisure',
  'Travel',
  'Religion / Spirituality',
  'Politics / Current Affairs',
  'Popular Science',
  'Business / Economics',
  'Health / Wellbeing',
  'Parenting / Family',
  'Education ',
  'Poetry / Plays',
  'Comics / Graphic Novels',
  'Music / Film',
  'Romance'
];
