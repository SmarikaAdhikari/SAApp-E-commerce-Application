import 'package:app/demo/getapi/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(accountFutureProvider);
  

    return Scaffold(
            body: details.when(data: (
        data,
      ) {
        return ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              horizontalTitleGap: 1,
              title: Text(data.totalCount.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: ListTile(
                      title: Text(data.items[index].address!),
                      subtitle: Text(data.items[index].name),
                    ),
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