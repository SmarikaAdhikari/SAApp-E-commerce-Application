
import 'dart:convert';

import 'package:app/api_all/api_genre/api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/dio.dart';
import '../../utils/my_config.dart';

final userServiceEnumProvider= Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<EnumModel> getEnum() async {
    const url = "book/getBooksByEnum/";
    try {
      final res = await Api().get(MyConfig.appUrl + url);
      final data = json.decode(res.data);
      return  EnumModel.fromJson(data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}