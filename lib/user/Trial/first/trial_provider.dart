// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:app/user/Trial/first/trial_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';

class Trialy extends ConsumerWidget {
  const Trialy({super.key});

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TrialyProvider = ref.watch(niceProvider);

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Star Wars"),
      ),
    body: 
    
    TrialyProvider.when(data: (data,) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("facts--${data.facts.first}")),
            );
        
       
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const SizedBox();
          }),
        );
    
    
  }
}