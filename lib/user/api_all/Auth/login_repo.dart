import 'dart:convert';

import 'package:app/user/api_all/Auth/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../../../dio.dart';
import '../../utils/my_config.dart';

class LoginRepo {
  Future<int?> login(
      String email, String password, BuildContext context) async {
    const url = "/user/login";
    var data = {
      "email": email,
      "password": password,
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);

      final token = json.decode(res.data)['token'];
      await setValue(accessToken, token);
      RestartAppTry.isL = true;
      Get.reset();
      // ignore: use_build_context_synchronously
      RestartAppTry.init(context);
      return res.statusCode;
    } catch (e) {
      return null;
    }
  }
}

final loginServiceProvider = Provider<LoginRepo>((ref) => LoginRepo());
