// import 'package:app/api/api_model.dart';
import 'dart:convert';

import 'package:app/services/dio.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/my_config.dart';
import 'api_user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<User>> getUsers() async {
    const url = "/book/getUserProfile";
    try {
      final res = await Api().get(MyConfig.appUrl + url);
      List data = json.decode(res.data);
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}