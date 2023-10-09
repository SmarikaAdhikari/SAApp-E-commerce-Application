// ignore_for_file: prefer_final_fields, unused_local_variable, avoid_print, non_constant_identifier_names, unused_result

// import 'package:app/user/widgets/constants.dart';
import 'dart:io';

// import 'package:app/user/api_all/api_book/api_service.dart';
// import 'package:app/user/api_all/api_book/api_service.dart';
import 'package:app/main.dart';
import 'package:app/user/api_all/api_author/api_model.dart';
import 'package:app/user/api_all/api_author/api_provider.dart';
import 'package:app/user/api_all/api_book/api_service.dart';
// import 'package:app/user/Views/page8.dart';
// import 'package:app/user/api_all/api_book/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../user/pages/genrepage.dart';

// import '../user/widgets/author.dart';

class PublishPage extends ConsumerStatefulWidget {
  const PublishPage({super.key});

  @override
  ConsumerState<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends ConsumerState<PublishPage> {
  String dropdownValue = 'Literary Fiction';
  late String authorValue ;
  bool isFile = false;
  File? image;
  Future pickGallery() async {
    try {
      final pimage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pimage == null) return;
      final imageTemp = File(pimage.path);
      image = imageTemp;
      isFile = true;

      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  // TextEditingController _authorController = TextEditingController();
  // TextEditingController _genreController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _releaseDateController = TextEditingController();
  TextEditingController _languageController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authorProvider = ref.watch(authorFutureProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 205, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 215, 226),
        title: const Center(
          child: Text(
            'Publish Book', 
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: isFile == true
                      ? Image.file(
                          image!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(hintText: '   Title'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                authorProvider.when(data: (data) {
                  return DropdownMenu<String>(
                    initialSelection: data.first.id,
                     onSelected: (String? value) {
                      setState(() {
                        authorValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        data.map<DropdownMenuEntry<String>>((Authors value) {
                      return DropdownMenuEntry<String>(
                          value: value.id, label: value.name);
                    }).toList(),
                  );
                }, error: (error, _) {
                  return Text(error.toString());
                }, loading: () {
                  return const SizedBox();
                }),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownMenu<String>(
                    initialSelection: Genres.first,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        Genres.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(hintText: '   Description'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        onSaved: (value) {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(hintText: '   Price'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _releaseDateController,
                      decoration:
                          const InputDecoration(hintText: '   Release Date'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _languageController,
                      decoration:
                          const InputDecoration(hintText: '   Language'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _lengthController,
                      decoration: const InputDecoration(hintText: '   Length'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // final publish = Publish(
                      //   title: _titleController.text,
                      //   description: _descriptionController.text,
                      //   image: image,
                      //   author: _authorController.text,
                      //   language: _languageController.text,
                      //   length: _lengthController.text,
                      //   releasedate: _releaseDateController.text,
                      //   genre: Genres.indexOf(dropdownValue),
                      //   price: _priceController.text,
                      // );

                      ref
                          .read(apiServiceProvider)
                          .createBook(
                            _titleController.value.text,
                            authorValue,
                            _descriptionController.value.text,
                            dropdownValue,
                            image,
                            _priceController.value.text,
                            _releaseDateController.value.text,
                            _lengthController.value.text,
                            _languageController.text,
                          
                          )
                          .then((value) {
                        Get.to(() => const MyHomePage());
                        ref.refresh(apiServiceProvider);
                      });
                    }
                  },
                  child: const Text('Publish'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

