
// ignore_for_file: unused_result

import 'dart:io';
import 'package:app/api_all/api_user/api_user_provider.dart';
import 'package:app/api_all/api_user/api_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Edits extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Edits(
      {super.key,
      required this.image,
      required this.name,
      required this.email,
      required this.bio,
      required this.password});

  final dynamic image;
  final String name;
  final String bio;
  final String email;
  final String password;
  // final dynamic image;

  @override
  ConsumerState<Edits> createState() => _EditsState();
}

class _EditsState extends ConsumerState<Edits> {
   File? image;


  Future pickImage() async {
    try {
      final pimage = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pimage == null) return;
      final imageTemp = File(pimage.path);
     image  = imageTemp;
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

   Future pickGallery() async {
    try {
      final pimage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pimage == null) return;
      final imageTemp = File(pimage.path);
     image  = imageTemp;
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController bioEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();


  @override
  void initState() {
  
    nameEditingController.text = widget.name;
    bioEditingController.text = widget.bio;
    emailEditingController.text = widget.email;
    passwordEditingController.text = widget.password;
    image = widget.image;
  
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image == null?
          const Icon(Icons.person, size: 100,):
          SizedBox(
                    height: 100, child: Image.file(image!),
              ),
       


          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            InkWell(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.camera,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Open Camera'),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  pickImage();
                                }),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.image,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Choose From Gallery'),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  pickGallery();
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                );
    
              },
              child: const Text("Upload Images")),


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
                hintText: "email",
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: emailEditingController,
              decoration: const InputDecoration(
                hintText: "password",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(userServiceProvider)
                  .updateUserProfile(
                    nameEditingController.value.text,
                    emailEditingController.value.text,
                    passwordEditingController.value.text,
                    bioEditingController.value.text,
                    image!.path,
                  )
                  .then((value) {
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
