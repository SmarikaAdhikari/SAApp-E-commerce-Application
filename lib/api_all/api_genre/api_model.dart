// import 'package:flutter/material.dart';

class EnumModel{
  final String id;
 final String name;
  
  
  
  EnumModel({

    required this.id,
    required this.name,
    });


  factory EnumModel.fromJson(Map<String,dynamic> json){
    return EnumModel(
      id: json['id'],
      name: json['name'],
    );
  } 
}