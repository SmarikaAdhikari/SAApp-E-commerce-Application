import 'dart:convert';

import 'package:app/dio.dart';
import 'package:app/publisher/api/api_model.dart';
import 'package:app/user/api_all/api_genre/api_service.dart';
import 'package:app/user/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pubOrderServiceProvider = Provider<ApiService>((ref) => ApiService());

final pubOrderProvider =
    FutureProvider<List<ApiModel>>((ref) async => getPublisherOrders());



Future<List<ApiModel>> getPublisherOrders() async {
  const url = "/report/getPublisherOrders";
  try {
    final res = await Api().get(getAppUrl() + url);
    List data = json.decode(res.data);
    return data.map((e) => ApiModel.fromJson(e)).toList();
  } catch (e) {
    throw Exception('Error getting suggestion $e');
  }
}