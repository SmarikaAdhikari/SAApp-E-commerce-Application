class EnumModel {
    String id;
    String title;
    String price;
    dynamic image;
    Author author;

    EnumModel({
        required this.id,
        required this.title,
        required this.price,
        this.image,
        required this.author,
    });

    factory EnumModel.fromJson(Map<String, dynamic> json) => EnumModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        image: json["image"],
        author: Author.fromJson(json["Author"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "image": image,
        "Author": author.toJson(),
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
