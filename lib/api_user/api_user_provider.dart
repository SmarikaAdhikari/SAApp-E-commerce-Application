// ignore_for_file: unused_local_variable, non_constant_identifier_names

// import 'package:app/api/api_provider.dart';
import 'package:app/api_user/api_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_user_service.dart';


final userFutureProvider =
    FutureProvider.autoDispose<List<User>>((ref) async {

  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getUsers();
});
class UserProviderPage extends ConsumerWidget {
  const UserProviderPage({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final userProvider = ref.watch(userFutureProvider  );
    return Scaffold(
      appBar:AppBar(
        title: const Text('User Provider'),
      ),
       body:Center(
          child: 
          userProvider.when(data: (data) {
            return Column(
              children: [
                Text(data[0].id.toString()),
                Text(data[0].email),
                Text(data[0].name),
                Text(data[0].password),
                Text(data[0].phone),
                Text(data[0].address),
              ],
            );
          },
           error: (error, _) {
            return Text(error.toString());
          }, 
          loading: () {
            return const CircularProgressIndicator();
          }),
        )
       




    );
  }
}
