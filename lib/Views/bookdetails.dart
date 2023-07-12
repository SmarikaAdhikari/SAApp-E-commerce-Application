// import 'package:app/Views/listgenre.dart';
// import 'package:app/Views/listgenre.dart';
import 'package:app/Views/Buynow.dart';
// import 'package:app/Views/page3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/author.dart';
import '../widgets/constants.dart';
import '../widgets/listswidget.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  final List<String> items = List<String>.generate(5, (i) => '$i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  Image.asset(
                    'view/kitabalaya.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 180,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Book Name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("Genre", style: TextStyle(fontSize: 15)),
                        Text("\$ 1000", style: TextStyle(fontSize: 15)),
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 15),
                        ),
                      ]),
                ]),
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "Author details",
            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            // ),
            Card(
              color: mainColor,
              child: author(),
            ),

            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "Reviews",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 90,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('pics/daisy.jpeg'),
                      child: Text(items[index]),
                    ),
                    title: Text('Item ${items[index]}'),
                    subtitle: Text('Item description'),
                  );
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              "Recommendation",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(children: List.generate(10, (index) => listswidget()))),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Buy Now",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(() => Pagethree());
                    },
                    icon: const Icon(Icons.add),
                  ),
                  Icon(Icons.attach_money),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
