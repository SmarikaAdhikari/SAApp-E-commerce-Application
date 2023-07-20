class Books {
  final String description;
  final String id;
  final String price;
  final String title;
  final dynamic image;
  final Author author;
  final Publisher publisher;
  final String? language;
  final String? length;
  final String? releasedate;
  final String? genre;
  




  Books({
    required this.description,
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.author,
    required this.genre,
    required this.publisher,
    required this.language,
    required this.length,
    required this.releasedate,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      description: json['description'],
      id: json['id'],
      price: json['price'],
      title: json['title'],
      // author: json['author'],
      author: Author.fromJson(json["Author"]),
      publisher: Publisher.fromJson(json["publisher"]),
      genre: json['genre'],
      image: json['image'],
      language: json['language'],
      length: json['length'],
      releasedate: json['releasedate'],
    );
  }
}
class Author {
    String name;

    Author({
        required this.name,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
    );

    
}
class Publisher {
    String name;

    Publisher({
        required this.name,
    });

    factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json["name"],
    );

    
}

