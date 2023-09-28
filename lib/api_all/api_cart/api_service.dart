// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:app/api_all/api_cart/api_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/retry.dart';

import '../../services/dio.dart';
import '../../utils/my_config.dart';

class CartProvider {
  
  Future<List<OrderModel>> getOrders() async {
    const url = "/order/getAllOrders";
    try {
      final res = await Api().get(getAppUrl() + url);

      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.data);
        List<OrderModel> posts = data
            .map(
              (dynamic item) => OrderModel.fromJson(item),
            )
            .toList();
        return posts;
      } else {
        throw "Unable to retrieve posts.";
      }
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

    Future<List<CartModel>> getAllCart() async {
    const url = "/cart/getAllCart";

    try {
      final res = await Api().get(getAppUrl() + url);
      List datas = json.decode(res.data);
      
      final returnData = datas.map((e) => CartModel.fromJson(e)).toList();
   
      return returnData;
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  Future <int> postOrder(var data) async {
    const url = "/order/createOrder";
    
    try {
      final res = await Api().post(getAppUrl() + url,data: data);
     
      return res.statusCode!;
     
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }

  
  get(Uri parse, {required Map<String, String> headers}) {}




    Future<List<SearchModel>> searchBook(dynamic data) async {
      final url = "/report/search?title=$data";
    try {
      final res = await Api().get(getAppUrl() + url,
     
      );
         List datas = json.decode(res.data);
        //  print(res.realUri);
      
      final returnData = datas.map((e) => SearchModel.fromJson(e)).toList();
   
      return returnData;
      
      
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
  
}


post(Uri parse, {required Map<String, String> headers, required String body}) {
}


final cartRepoProvider = Provider<CartProvider>((ref) {
  return CartProvider();
});

final orderProvider = FutureProvider.autoDispose<List<OrderModel>>((ref) async {
  final repo = ref.watch(cartRepoProvider);
  return repo.getOrders();
});

final cartProvider = FutureProvider.autoDispose<List<CartModel>>((ref) async {
  final repo = ref.watch(cartRepoProvider);
  return repo.getAllCart();
});

final searchProvider = FutureProvider.family.autoDispose<List<SearchModel>,dynamic>((ref,data) async {
  final repo = ref.watch(cartRepoProvider);
  return repo.searchBook(data);
});
