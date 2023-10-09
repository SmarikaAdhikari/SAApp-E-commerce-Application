class Authors {
final String id;
final String name;
final String bio;
final String dob;
final String address;
final String description;

Authors({
  required this.id,
  required this.name,
  required this.bio,
  required this.dob,
  required this.address,
  required this.description,
});

factory Authors.fromJson(Map<String, dynamic> json) {
  return Authors(
    id: json['id'],
    name: json['name'],
    bio: json['bio'],
    dob: json['dob'],
    address: json['address'],
    description: json['description'],
  );
}
}