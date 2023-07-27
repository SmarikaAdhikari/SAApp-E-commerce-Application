import 'package:app/api_all/api_book/api_service.dart';
// import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'book_model.dart';

final bookByIdStateProvider = StateProvider<String>((ref) => "");

final bookByIdFutureProvider =
    FutureProvider<BookDetailModel>((ref) async {
  // ignore: non_constant_identifier_names
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getBooksById(ref.watch(bookByIdStateProvider));
});

final  booksFutureProvider=
    FutureProvider<List<BookModel>>((ref) async {
  // ignore: non_constant_identifier_names
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getBooks();
});

