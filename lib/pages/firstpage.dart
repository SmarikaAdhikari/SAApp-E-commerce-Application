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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 243, 252),
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
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 200,
                      color: Colors.blue[100],
                    ),
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
              Text("Best Sellers",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      Row(children: List.generate(10, (index) => listswidget()))
                  // for(int i=0;i<10;i++){
                  //   listswidget()
                  // }

                  // Container(
                  //   height: 130,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     padding: EdgeInsets.only(left: 0, right: 0),
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return listswidget();
                  //     },
                  //   ),
                  // ),
                  ),
              SizedBox(height: 10),
              Text("New Releases",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return searchWidget();
                },
                itemCount: 6,
              ),
            ]),
          ),
        ));
  }
}
