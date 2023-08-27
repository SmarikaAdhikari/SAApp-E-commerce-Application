import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartNotifierModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  double price;
  @HiveField(2)
  int quantity;
  @HiveField(3)
  String title;
  @HiveField(4)
  dynamic image;

  CartNotifierModel({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.image,
  });
}
