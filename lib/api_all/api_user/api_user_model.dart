class User {
 final String id;
 final String email;
 final String name;
 final String password;
 final String phone;
  final String address;
 final  dynamic image;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.address,
    required this.image,

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
   
    );
  } 

}