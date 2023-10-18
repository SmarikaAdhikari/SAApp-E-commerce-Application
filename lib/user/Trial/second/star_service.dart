

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:app/dio.dart';
import 'package:app/user/Trial/second/star_model.dart';
// import 'package:app/user/Trial/second/star_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final starServiceProvider = Provider<StarService>((ref) => StarService());

final starFutureProvider = FutureProvider.autoDispose<List<Starwars>>((ref) async {
  final ApiService = ref.watch(starServiceProvider);
  return ApiService.getStarwars();
});

class StarService{

Future<List<Starwars>> getStarwars() async {
  const url = "https://swapi.dev/api/people";
  try {
    final res = await Api().get(url);
    List data = json.decode(res.data)['results'];
    // print (res.data);

    return data.map((e) => Starwars.fromJson(e)).toList();

  } catch (e) {
    throw Exception('Error getting suggestion $e');
  }
}
}