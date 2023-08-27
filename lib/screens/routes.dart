import 'package:app/Views/bookdetails.dart';
import 'package:app/api_all/Auth/constants.dart';
import 'package:app/main.dart';
import 'package:app/pages/loginpage.dart';
import 'package:app/widgets/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

List<GetPage> pages = [
  GetPage(
    name: '/home',
    page: () => const MyHomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/welcome',
    page: () => const WelcomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/bookdetails',
    page: () => BookDetails(id: "1"),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  )
];

class RouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = getStringAsync(accessToken);
    if (token.isEmptyOrNull) {
      return const RouteSettings(name: '/login');
    } else {
      return null;
    }
  }
}
