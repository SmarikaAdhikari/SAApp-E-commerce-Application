
import 'dart:convert';

import 'package:app/api_all/api_genre/api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/dio.dart';
import '../../utils/my_config.dart';

final genreProvider= Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<EnumModel> >getGenreById(int number) async {
    final url = "/book/getBooksByEnum/$number";
    try {
      final res = await Api().get(MyConfig.appUrl + url);
      List<dynamic> data = json.decode(res.data);
      
      return data.map((e) => EnumModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}