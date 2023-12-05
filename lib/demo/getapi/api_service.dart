// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:app/demo/getapi/api_model.dart';
import 'package:app/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final ServiceProvider = Provider<AccountService>((ref) => AccountService());

final accountFutureProvider = FutureProvider.autoDispose<Account>((ref) async {
  final ApiService = ref.watch(ServiceProvider);
  return ApiService.getAccounts();
});

class AccountService{

Future<Account> getAccounts() async {
  const url = "http://campusapi.suktas.com/api/services/app/AccountLedgers/GetAll";
  try {
    final res = await Api().get(url);
    final data = json.decode(res.data)['results'];
  
    print (data);
    // Get .to(const AccountPage());
    return Account.fromJson(data);

  } catch (e) {
    throw Exception('Error getting suggestion $e');
  }

}

}