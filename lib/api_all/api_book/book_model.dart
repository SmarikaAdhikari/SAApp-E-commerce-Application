// ignore: file_names
class BookModel {
  
  final String id;
  final String price;
  final String title;
  final dynamic image;
  




  BookModel({
   
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      
      id: json['id'],
      price: json['price'],
      title: json['title'],
      image: json['image'],
     
    );
  }
}


class BookDetailModel {
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
  final int genre;
  final bool isFavorite;
  




  BookDetailModel({
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
    required this.isFavorite,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    return BookDetailModel(
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
      isFavorite: json['isFavorite'],
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


// ignore: file_names
class FavModel {
  
  final String id;
  final Author author;
  final String title;
  final dynamic image;
  




  FavModel({
   
    required this.id,
    required this.author,
    required this.title,
    required this.image,
    
  });

  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      
      id: json['id'],
      author: Author.fromJson(json["Author"]),
      title: json['title'],
      image: json['image'],
     
    );
  }
}
