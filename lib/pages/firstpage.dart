// ignore_for_file: non_constant_identifier_names

import 'package:app/api/api_provider.dart';
import 'package:app/widgets/listswidget.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/searchwidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/constants.dart';

class Firstpage extends ConsumerWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final FutureProvider = ref.watch(suggestionFutureProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: mainColor,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            // SizedBox(height: 20, width: 30),
                            Column(
                              children: [
                                Text("Embrace your inner bookworm...",
                                    style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                                Text("with",
                                    style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                                Text("THE BOOK STACK",
                                    style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                                // sizedBox(height: 20, width: 30),
                                Image(
                                    image: AssetImage('view/BSS.png'),
                                    height: 50,
                                    width: 80),
                              ],
                            ),
                          ],
                        ),
                        // const SizedBox(height: 20, width: 30),
                        Image.asset(
                          'view/kitabalaya.png',
                          fit: BoxFit.cover,
                          height: 150,
                          width: 180,
                        ),
                      ],
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
              const Text("New Releases",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              FutureProvider.when(
                  data: (data) => GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 350,
                          childAspectRatio: 2 / 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return searchWidget(
                            data[index],
                          );
                        },
                        itemCount: data.length,
                      ),
                  error: (Object error, StackTrace stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  }),
            ]),
          ),
        ));
  }
}
