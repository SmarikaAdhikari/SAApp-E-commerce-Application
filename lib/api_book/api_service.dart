// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/api_book/api_model.dart';
import 'package:app/services/dio.dart';
import 'package:app/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<Books>> getProducts() async {
    const url = "/book/getallbooks";
    try {

      final res = await Api().get(MyConfig.appUrl + url);
      List data = json.decode(res.data);

      return data.map((e) => Books.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
