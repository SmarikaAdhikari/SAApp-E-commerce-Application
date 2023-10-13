 import 'dart:convert';

import 'package:app/admin/api/api_model.dart';
import 'package:app/dio.dart';
import 'package:app/user/api_all/api_genre/api_service.dart';
import 'package:app/user/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardServiceProvider = Provider<ApiService>((ref) => ApiService());

final dashboardProvider =
    FutureProvider<DashboardModel>((ref) async => getDashboard());

    
Future<DashboardModel> getDashboard() async {
  const url = "/report/getDashboardData";
  try {
    final res = await Api().get(getAppUrl() + url);
    final data = json.decode(res.data);
    return DashboardModel.fromJson(data);
  } catch (e) {
    throw Exception('Error getting suggestion $e');
  }
}