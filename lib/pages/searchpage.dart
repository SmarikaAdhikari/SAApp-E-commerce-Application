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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 243, 252),
                  borderRadius: BorderRadius.circular(40)),
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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                    return searchWidget();
                  },
                  itemCount: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
