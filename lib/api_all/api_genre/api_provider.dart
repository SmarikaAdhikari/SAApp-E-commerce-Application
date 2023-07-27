// ignore_for_file: non_constant_identifier_names
import 'package:app/api_all/api_genre/api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_service.dart';

final genreStateProvider = StateProvider<int>((ref) => 0);

final genreByIdProvider =
    FutureProvider<List<EnumModel>>((ref) async {

  final ApiService = ref.watch(genreProvider);
  return ApiService.getGenreById(ref.watch(genreStateProvider));
});
