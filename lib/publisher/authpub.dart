// ignore_for_file: unused_field, unused_result

// import 'package:app/main.dart';
import 'package:app/publisher/publish.dart';
import 'package:app/user/api_all/api_author/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../user/api_all/api_author/api_service.dart';

class AuthorPublish extends ConsumerStatefulWidget {
  const AuthorPublish({super.key});

  @override
  ConsumerState<AuthorPublish> createState() => _AuthorPublishState();
}

class _AuthorPublishState extends ConsumerState<AuthorPublish> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _bioController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 163, 205, 239),
      appBar: AppBar(
        title: const Text('Publish Author'),
        backgroundColor: const Color.fromARGB(255, 182, 202, 237),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
           key: _formKey,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: '   Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onSaved: (value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _dobController,
                    decoration: const InputDecoration(hintText: '   DOB'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                    onSaved: (value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _bioController,
                    decoration: const InputDecoration(hintText: '   Bio'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onSaved: (value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: '   Address'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onSaved: (value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: '   Description'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onSaved: (value) {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                   if (_formKey.currentState!.validate()) {

                  
                        ref
                            .read(autServiceProvider)
                            .createAuthor(
                              _nameController.value.text,
                              _dobController.value.text,
                              _bioController.value.text,
                              _addressController.value.text,
                              _descriptionController.value.text,
                             
                            )
                            .then((value) {
                          Get.to(() => const PublishPage());
                          ref.refresh(authorFutureProvider);
                        });
                      }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
