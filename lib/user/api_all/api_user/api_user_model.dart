class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final String phone;
  final String address;
  final dynamic image;
  final dynamic bio;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.address,
    required this.image,
    required this.bio,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      image: json['image'],
      bio: json['bio'],
    );
  }
}
class VerifyModel
{
  final String? email;
  final String? userotp;

  VerifyModel({
    this.email,

    this.userotp,
  });


  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
    email: json["email"],

    userotp: json["userotp"],
  );







}



class SignupModel{
  String name;
  String email;
  String phone;
  String password;
  String address;
  String bio;
  String? image;
  bool isPublisher;

  SignupModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.bio,
     this.image,
    required this.isPublisher,
  });
}