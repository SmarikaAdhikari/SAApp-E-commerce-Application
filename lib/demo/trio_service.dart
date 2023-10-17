// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:app/demo/try.dart';
import 'package:app/dio.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';




class Logs {
  Future<int?> login(String email, String password, BuildContext context) async {
    const url = "http://campusapi.suktas.com/api/TokenAuth/Authenticate";
    var data = {
      "userNameOrEmailAddress": email,
      "password": password,
    };
    try {
      final res = await Api().post(url, data: data);
          if (res.statusCode == 200) {
       Get.to(const Trio());

      }
      else{
      Fluttertoast.showToast(msg: "incorrect password or email");
      }
      //  print(res.statusCode);
       RestartAppTry.init(context);
      return res.statusCode;
    } catch (e) {
      return null;
      //rethrow;
    }
  }
}

final loginProvider = Provider<Logs>((ref) => Logs());
