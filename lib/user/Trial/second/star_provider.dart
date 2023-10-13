// import 'dart:js_interop';

import 'package:app/user/Trial/second/star_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';

class StarWars extends ConsumerWidget {
  const StarWars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starProvider = ref.watch(starFutureProvider);
    return Scaffold(
      body: starProvider.when(data: (
        data,
      ) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              horizontalTitleGap: 1,
              title: Text(data[index].name.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Flims\n ${data[index].films.toString()}\n"),
                  ),
                ],
              ),
            );
          },
        );
      }, error: (error, _) {
        return Text(error.toString());
      }, loading: () {
        return const SizedBox();
      }),
    );
  }
}
