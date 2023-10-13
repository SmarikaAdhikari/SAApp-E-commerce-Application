class ApiModel {
    final String id;
    final String userId;
    final String publisherId;
    final String orderId;
    final String bookId;
    final String status;
    final dynamic bookname;
    final int quantity;
    final int price;

   ApiModel({
        required this.id,
        required this.userId,
        required this.publisherId,
        required this.orderId,
        required this.bookId,
        required this.status,
        required this.bookname,
        required this.quantity,
        required this.price,
    });

    factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        id: json["id"],
        userId: json["userId"],
        publisherId: json["publisherId"],
        orderId: json["orderId"],
        bookId: json["bookId"],
        status: json["status"],
        bookname: json["bookname"],
        quantity: json["quantity"],
        price: json["price"],
    );

 
}