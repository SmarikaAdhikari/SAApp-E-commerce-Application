// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/api_all/api_author/api_model.dart';
// import 'package:app/api_book/api_model.dart';
import 'package:app/services/dio.dart';
import 'package:app/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final autServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Authors> getAuthor() async {
    const url = "/book/getallauthors";
    try {

      final res = await Api().get(MyConfig.appUrl + url);
     final data = json.decode(res.data);
      return  Authors.fromJson(data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
