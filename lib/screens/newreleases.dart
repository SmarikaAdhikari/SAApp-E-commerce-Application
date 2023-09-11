// import 'package:app/widgets/drawerWidget.dart';
// import 'package:app/widgets/trial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_all/api_book/api_provider.dart';
import '../widgets/new_release.dart';
// import 'package:get/get.dart';

// import '../main.dart';
// import '../widgets/genrelist.dart';

class Newreleases extends ConsumerWidget {
  const Newreleases({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     // ignore: unused_local_variable, non_constant_identifier_names
     final FutureProvider = ref.watch(booksFutureProvider);
    return Scaffold(
        appBar: AppBar(),
        body: FutureProvider.when(
                data: (data) => GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.4 / 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return newRelease(
                          data[index],
                          data[index].id.toString(),
                          ref,
                          context,
                        );
                      },
                      itemCount: data.length,
                    ),
                error: (Object error, StackTrace stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return const SizedBox();
                }));
  }
}
