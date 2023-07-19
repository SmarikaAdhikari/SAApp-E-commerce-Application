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
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: mainColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 15,
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            Column(
                              children: [
                                Text("Embrace your inner bookworm...",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                                Text("with",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Image(
                                    image: AssetImage('view/BSS.png'),
                                    height: 70,
                                    width: 100),
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          'view/kitabalaya.png',
                          fit: BoxFit.cover,
                          height: 140,
                          width: 170,
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
