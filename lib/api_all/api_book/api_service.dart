// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/api_all/api_book/book_model.dart';
import 'package:app/services/dio.dart';
import 'package:app/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../api_user/api_user_model.dart';
// import 'package:nb_utils/nb_utils.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<BookModel>> getBooks() async {
    const url = "/book/getallbooks";
    try {

      final res = await Api().get(MyConfig.appUrl + url);
      List data = json.decode(res.data);

      return data.map((e) => BookModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

   Future<void> addFavorite(String bookId) async {
    const url = "/favorite/createFavorite";
    var data = {
      "bookId": bookId,
    };
    try {

      final res = await Api().post(MyConfig.appUrl + url, data: data);
     
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
  Future<BookDetailModel> getBooksById(String bookId) async {
   final url = "/book/getBookById/$bookId";

    try {

      final res = await Api().get(MyConfig.appUrl + url);
      // print(res.statusCode);
      final data = json.decode(res.data);
      return  BookDetailModel.fromJson(data);
     
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
 
}
