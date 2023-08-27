// import 'package:app/api_all/api_book/book_model.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:app/widgets/favouritewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../api_all/api_book/api_provider.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final FavProvider = ref.watch(favFutureProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          left: 8.0,
        ),
        child: FavProvider.when(
            data: (data) => ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: favouriteWidget(
                          data[index],
                          data[index].id.toString(),
                          ref,
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
            error: (Object error, StackTrace stackTrace) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      "Please Login",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/login");
                        },
                        child: const Text("Login"))
                  ],
                ),
              );
            },
            loading: () {
              return const SizedBox();
            }),
      ),
    );
  }
}
