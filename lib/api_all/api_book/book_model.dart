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
  final bool isReading;
  final bool isCart;
  




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
    required this.isReading,
    required this.isCart,
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
      isReading: json['isReading'],
      isCart: json['isCart'],
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
    String id;
    Book book;

    FavModel({
        required this.id,
        required this.book,
    });

    factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        id: json["id"],
        book: Book.fromJson(json["book"]),
    );

   
}

class Book {
    String id;
    String title;
    dynamic image;
    int genre;
    Author author;

    Book({
        required this.id,
        required this.title,
        required this.image,
        required this.genre,
        required this.author,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        genre: json["genre"],
        author: Author.fromJson(json["Author"]),
    );

   
}


class CartModel {
    String id;
    String userId;
    String bookId;
    Kitab kitab;

   CartModel ({
        required this.id,
        required this.userId,
        required this.bookId,
        required this.kitab,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        bookId: json["bookId"],
        kitab: Kitab.fromJson(json["book"]),
    );

}
class Kitab {
    String id;
    String title;
    String price;
    dynamic image;

    Kitab({
        required this.id,
        required this.title,
        required this.price,
        required this.image,
    });

    factory Kitab.fromJson(Map<String, dynamic> json) => Kitab(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        image: json["image"],
    );

}
