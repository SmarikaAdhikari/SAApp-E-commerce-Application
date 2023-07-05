import 'package:app/widgets/listswidget.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/searchwidget.dart';

import '../widgets/listswidget.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.blue[100],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Image.asset(
                      'view/kitabalaya.png',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 180,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Best Sellers",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(10, (index) => listswidget()))),
              const SizedBox(height: 10),
              const Text("New Releases",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return searchWidget();
                },
                itemCount: 8,
              ),
            ]),
          ),
        ));
  }
}
