import 'package:app/api/api_model.dart';
import 'package:app/api/api_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<List<Books>>((ref) async {
  // ignore: non_constant_identifier_names
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getProducts();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: non_constant_identifier_names
    final FutureProvider = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: 
        Center(
          child: 
          FutureProvider.when(data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Card(
                child: Column(
                  children: [
                    Text(
                      data[index].id.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      data[index].description,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      data[index].price.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      data[index].title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    
                  ],
                ),
              ),
            );
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          }),
        )
        );
  }
}
