class Welcome {
    String id;
    String title;
    String price;
    String description;
    String image;
    String genre;
    DateTime createdAt;
    DateTime updatedAt;
    String language;
    String length;
    DateTime releasedAt;
    String publisherId;
    String authorId;
    Author author;
    Author publisher;

    Welcome({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.image,
        required this.genre,
        required this.createdAt,
        required this.updatedAt,
        required this.language,
        required this.length,
        required this.releasedAt,
        required this.publisherId,
        required this.authorId,
        required this.author,
        required this.publisher,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        genre: json["genre"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        language: json["language"],
        length: json["length"],
        releasedAt: DateTime.parse(json["releasedAt"]),
        publisherId: json["publisherId"],
        authorId: json["authorId"],
        author: Author.fromJson(json["Author"]),
        publisher: Author.fromJson(json["publisher"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "genre": genre,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "language": language,
        "length": length,
        "releasedAt": "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "publisherId": publisherId,
        "authorId": authorId,
        "Author": author.toJson(),
        "publisher": publisher.toJson(),
    };
}

class Author {
    String name;

    Author({
        required this.name,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}