// import 'package:app/api/api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<User>> getUsers() async {
    try {
      final res = await Dio().get('http://10.0.2.2:8080/book/getUserProfile');
      List data = res.data;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}