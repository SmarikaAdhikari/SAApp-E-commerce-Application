import 'package:app/widgets/searchwidget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:GridView.builder(
          // height: 200,
          shrinkWrap: true,
            physics:const AlwaysScrollableScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
              
              ),
          itemBuilder: (context, index) {
            return searchWidget();
          },
          itemCount: 14,
          
        ),


    );
  }
}
//  GridView.builder(
//             shrinkWrap: true,
//             physics: AlwaysScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemBuilder: (_, index) => FlutterLogo(),
//       itemCount: 12,
//       ),