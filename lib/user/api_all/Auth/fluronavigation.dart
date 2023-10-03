// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages
// import 'package:app/main.dart';
import 'package:app/user/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static FluroRouter getRouter() {
    final router = FluroRouter();

    // router.define('home',
    //     handler: Handler(
    //         handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
    //             MyHomePage()));

    router.define('login',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                LoginPage()));

    return router;
  }
}
