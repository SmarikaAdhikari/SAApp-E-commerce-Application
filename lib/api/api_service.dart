import 'package:app/api/api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<Books>> getProducts() async {
    try {
      final res = await Dio().get('http://192.168.1.101:8080/getallbooks');
      List data = res.data;
      return data.map((e) => Books.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
