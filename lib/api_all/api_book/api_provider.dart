// ignore_for_file: non_constant_identifier_names

import 'package:app/api_all/api_book/api_service.dart';
// import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'book_model.dart';

final bookByIdStateProvider = StateProvider<String>((ref) => "");
final  favBookFutureProvider = StateProvider<String>((ref) => "");
final  readBookFutureProvider = StateProvider<String>((ref) => "");
final bookByIdFutureProvider =
    FutureProvider.family<BookDetailModel, String>((ref, id) async {

  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getBooksById(id);
});

final  booksFutureProvider=
    FutureProvider<List<BookModel>>((ref) async {
 
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getBooks();
});


final  favFutureProvider =
    FutureProvider<List<FavModel>>((ref) async {
 
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getAllFavorites();
});

final  readFutureProvider =
    FutureProvider<List<FavModel>>((ref) async {

  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getAllReading();
});
final  cartFutureProvider =
    FutureProvider<List<CartModel>>((ref) async {
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getAllCart();
});
