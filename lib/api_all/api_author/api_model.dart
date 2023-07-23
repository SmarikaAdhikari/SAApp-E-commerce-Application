class Author {

final String name;
final String bio;
final String dob;
final String address;
final String description;

Author({
  required this.name,
  required this.bio,
  required this.dob,
  required this.address,
  required this.description,
});

factory Author.fromJson(Map<String, dynamic> json) {
  return Author(
    name: json['name'],
    bio: json['bio'],
    dob: json['dob'],
    address: json['address'],
    description: json['description'],
  );
}





}