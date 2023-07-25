// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:app/api_all/api_book/api_model.dart';
import 'package:app/services/dio.dart';
import 'package:app/utils/my_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../api_user/api_user_model.dart';
// import 'package:nb_utils/nb_utils.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<Books>> getProducts() async {
    const url = "/book/getallbooks";
    try {

      final res = await Api().get(MyConfig.appUrl + url);
      List data = json.decode(res.data);

      return data.map((e) => Books.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

   void addFavorite(String bookId) async {
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
  Future<Books> getBooksById(String bookId) async {
   final url = "/book/getBookById/$bookId";
    // var data = {
    //   "bookId": bookId,
    // };
    try {

      final res = await Api().get(MyConfig.appUrl + url);
       
      final data = json.decode(res.data);
      return  Books.fromJson(data);
     
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
  Future<Books> getBooksByEnum(String genre) async {
   final url = "/book/getBookByEnum/$genre";
    // var data = {
    //   "bookId": bookId,
    // };
    try {

      final res = await Api().get(MyConfig.appUrl + url);
       
      final data = json.decode(res.data);
      return  Books.fromJson(data);
     
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
