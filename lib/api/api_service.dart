import 'dart:convert';

import 'package:app/api/api_model.dart';
import 'package:app/services/dio.dart';
import 'package:app/utils/my_config.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<Books>> getProducts() async {
    const url = "/book/getallbooks";
    try {
<<<<<<< HEAD
      final res = await Api().get(MyConfig.appUrl + url);
      List data = json.decode(res.data);
=======
      final res = await Dio().get('http://192.168.1.68:8080/book/getallbooks');
      List data = res.data;
>>>>>>> ee8e789361ddcfa0d50152bc413d511fd45ddfc2
      return data.map((e) => Books.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
