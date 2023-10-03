import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadPage extends ConsumerStatefulWidget {
  const FileUploadPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends ConsumerState<FileUploadPage> {
  List<File> images = [];
  List<File> filess = [];
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      images.add(imageTemp);
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickGallery() async {
    try {
      final image = await ImagePicker().pickMultiImage();
      if (image.isEmpty) return;
      for (var i in image) {
        final imageTemp = File(i.path);
        images.add(imageTemp);
      }
      setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        images.removeAt(index);
                      },
                      child: SizedBox(
                          height: 100, child: Image.file(images[index]))),
                );
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Upload Files")),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filess.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        filess.removeAt(index);
                      },
                      child: SizedBox(
                          child: Text(filess[index].path.split('/').last))),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
