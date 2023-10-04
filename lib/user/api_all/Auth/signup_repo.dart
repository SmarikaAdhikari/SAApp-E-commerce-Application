import 'package:app/user/api_all/api_user/api_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../dio.dart';
import '../../utils/my_config.dart';

class SignUpRepo {
  Future<void> signUp(SignupModel signupdata) async {
    const url = "/user/register";
    var data = {
      "name": signupdata.name,
      "email": signupdata.email,
      "phone": signupdata.phone,
      "address": signupdata.address,
      "password": signupdata.password,
      "bio": signupdata.bio,
      "isPublisher": signupdata.isPublisher,
      "image": signupdata.image,
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
      if (res.statusCode == 200) {
        Get.toNamed('/login');
        Fluttertoast.showToast(msg: "Registered Successfully");
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}

final signUpServiceProvider = Provider<SignUpRepo>((ref) => SignUpRepo());
