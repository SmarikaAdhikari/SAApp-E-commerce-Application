import 'package:app/Views/Buynow.dart';
import 'package:app/widgets/genrelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../api_all/api_genre/api_provider.dart';

class EnumList extends ConsumerStatefulWidget {
  const EnumList({
    super.key,
  });

  @override
  ConsumerState<EnumList> createState() => _EnumListState();
}

class _EnumListState extends ConsumerState<EnumList> {
  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(genreByIdProvider);
    //  Books data;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: TextButton(
          onPressed: () {
            Get.to(() => BuyNow());
          },
          child: userProvider.when(
              data: (data) => data.isEmpty
                  ? const Center(child: Text('No data found'))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        child: GenreList(data[index]),
                      ),
                    ),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const SizedBox();
              }),
        ),
      ),
    );
  }
}
