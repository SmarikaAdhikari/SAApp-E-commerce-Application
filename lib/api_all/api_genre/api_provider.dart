// ignore_for_file: non_constant_identifier_names

import 'package:app/api_all/api_genre/api_model.dart';
// import 'package:app/api_all/api_user/api_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_service.dart';
// import 'api_user_service.dart';


final userEnumProvider =
    FutureProvider.autoDispose<EnumModel>((ref) async {

  final ApiService = ref.watch(userServiceEnumProvider);
  return ApiService.getEnum();
});
class UserProviderPage extends ConsumerWidget {
  const UserProviderPage({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final userProvider = ref.watch(userEnumProvider);
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
                
                Text(data.name),
                
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