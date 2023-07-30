// ignore_for_file: unused_local_variable, non_constant_identifier_names

// import 'package:app/api/api_provider.dart';
import 'package:app/api_all/api_user/api_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_user_service.dart';


final userFutureProvider =
    FutureProvider.autoDispose<User>((ref) async {

  final ApiService = ref.watch(userServiceProvider);
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
                Text(data.id.toString()),
                Text(data.email),
                Text(data.name),
                Text(data.password),
                Text(data.phone),
                Text(data.address),
                Text(data.image),
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
