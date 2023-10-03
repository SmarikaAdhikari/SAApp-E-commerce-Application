import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../dio.dart';
import '../../utils/my_config.dart';

class SignUpRepo {
  Future<void> signUp(String name, String email, String phone, String password,
      String address, String bio, bool isPublisher, String? image) async {
    const url = "/user/register";
    var data = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "password": password,
      "bio": bio,
      "isPublisher": isPublisher,
      "image": image
    };
    try {
      final res = await Api().post(getAppUrl() + url, data: data);
      if (res.statusCode == 200) {
        Fluttertoast.showToast(msg: "Registered Successfully");
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}

final signUpServiceProvider = Provider<SignUpRepo>((ref) => SignUpRepo());
