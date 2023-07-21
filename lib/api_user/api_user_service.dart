// import 'package:app/api/api_model.dart';
import 'dart:convert';

import 'package:app/services/dio.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/my_config.dart';
import 'api_user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<User> getUsers() async {
    const url = "/user/getUserProfile";
    try {
      final res = await Api().get(MyConfig.appUrl + url);
      final data = json.decode(res.data);
      return  User.fromJson(data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}