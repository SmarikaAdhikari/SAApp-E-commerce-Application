// import 'package:app/main.dart';
// import 'package:app/pages/profilepage.dart';
// ignore_for_file: unused_result

// import 'package:app/api_all/api_book/api_service.dart';
import 'package:app/api_all/api_user/api_user_provider.dart';
import 'package:app/api_all/api_user/api_user_service.dart';
// import 'package:app/widgets/bio.dart';
// import 'package:app/widgets/date.dart';
// import 'package:app/widgets/new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Edits extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Edits({super.key, required this.name, required this.email, required this.bio, required this.password});
  final String name;
  final String bio;
  final String email;
  final String password;

  @override
  ConsumerState<Edits> createState() => _EditsState();
}

class _EditsState extends ConsumerState<Edits> {
  TextEditingController nameEditingController = TextEditingController( );
  TextEditingController bioEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  void initState(){
    nameEditingController.text = widget.name;
     bioEditingController.text = widget.bio;
    emailEditingController.text = widget.email;
    passwordEditingController.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: nameEditingController,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: bioEditingController,
              decoration: const InputDecoration(
                hintText: "bio",
              ),
            ),
          ),
              const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextField(
              controller: passwordEditingController,
              decoration: const InputDecoration(
                hintText: "password",
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: emailEditingController,
              decoration: const InputDecoration(
                hintText: "email",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userServiceProvider).updateUserProfile(nameEditingController.value.text, emailEditingController.value.text, passwordEditingController.value.text,bioEditingController.value.text,).then((value) {
                ref.refresh(userFutureProvider);
              });
              
              Get.back();
             
            },
            child: const Text("Done"),
          ),
        ],
      )),
    );
  }
}
