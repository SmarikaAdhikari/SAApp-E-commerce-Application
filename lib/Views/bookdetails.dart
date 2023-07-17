// ignore_for_file: must_be_immutable

import 'package:app/Views/Buynow.dart';
import 'package:app/api/api_model.dart';
import 'package:app/api/api_provider.dart';
import 'package:app/widgets/listswidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../widgets/author.dart';
import '../widgets/constants.dart';

class Pageone extends ConsumerStatefulWidget {
  Pageone({super.key, required this.data});
  Books data;
  @override
  ConsumerState<Pageone> createState() => _PageoneState();
}

class _PageoneState extends ConsumerState<Pageone> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final FutureProvider = ref.watch(suggestionFutureProvider);
    final List<String> items = List<String>.generate(5, (i) => '$i');
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
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(widget.data.author,
                            style: const TextStyle(fontSize: 15)),
                        Text(widget.data.price,
                            style: const TextStyle(fontSize: 15)),
                        Text(
                          widget.data.description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ]),
                ]),
              ),
            ),
            Card(
              color: mainColor,
              child: author(),
            ),
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: const AssetImage('pics/daisy.jpeg'),
                      child: Text(items[index]),
                    ),
                    title: Text('Item ${items[index]}'),
                    subtitle: const Text('Item description'),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Recommendation",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            FutureProvider.when(
                data: (data) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(data.length, (index) {
                      return listswidget(
                        data[index],
                      );
                    }))),
                error: (Object error, StackTrace stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return const CircularProgressIndicator();
                }),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Buy Now",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(() => Pagethree());
                    },
                    icon: const Icon(Icons.add),
                  ),
                  const Icon(Icons.attach_money),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
