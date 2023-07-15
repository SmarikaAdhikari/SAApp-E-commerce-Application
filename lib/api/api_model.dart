class Books {
  final String description;
  final String id;
  final String price;
  final String title;
  final String author;

  Books({
    required this.description,
    required this.id,
    required this.price,
    required this.title,
    required this.author,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      description: json['description'],
      id: json['id'],
      price: json['price'],
      title: json['title'],
      author: json['author'],
    );
  }
}
