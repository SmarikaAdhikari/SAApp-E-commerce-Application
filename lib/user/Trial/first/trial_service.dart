


// ignore_for_file: non_constant_identifier_names, unused_local_variable

// import 'dart:convert';

import 'package:app/user/Trial/first/trial_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final niceProvider =
    FutureProvider.autoDispose<Trialy>((ref) async {

  final ApiService = ref.watch(TrialProvider);
  return ApiService.getTrial();
});

final TrialProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Trialy> getTrial() async {
    try {
      final res = await Dio().get('https://dogapi.dog/api/facts');
      final data = res.data;
      print(data);
      return Trialy.fromJson(data);
    
 
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}