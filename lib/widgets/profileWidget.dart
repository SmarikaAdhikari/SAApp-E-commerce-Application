// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../api_all/api_user/api_user_model.dart';

Widget profileWidget(
  User profile,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(profile.name),
        Text(profile.bio.toString()),
        Text(profile.email),
      ],
    ),
  );
}
