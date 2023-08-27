// import 'package:app/api_all/api_book/book_model.dart';
import 'package:app/api_all/api_book/cart_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget orderWidget(
  CartNotifierModel data,
  String id,
  WidgetRef ref,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        data.image == null
            ? Image.asset(
                "pics/daisy.jpeg",
                height: 120,
                width: 100,
              )
            : CachedNetworkImage(
                imageUrl: data.image,
                height: 120,
                width: 100,
              ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title),
            Text(data.price.toString()),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // ref.read(cartProvider.notifier).increment(data);
                },
                icon: const Icon(Icons.add),
              ),
              Text(data.quantity.toString()),
              IconButton(
                onPressed: () {
                  // ref.read(cartProvider.notifier).decrement(data);
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        )
      ],
    ),
  );
}


//  class CartProductsNotifier extends ChangeNotifier {
//   List<CartNotifierModel> cartproducts = [];

//   void addProduct(CartNotifierModel product) {
//     cartproducts.add(product);
//     notifyListeners();
//   }

//   void removeProduct(CartNotifierModel product) {
//     cartproducts.remove(product);
//     notifyListeners();
//   }

//   void increment(CartNotifierModel product) {
//     product.quantity++;
//     notifyListeners();
//   }

//   void decrement(CartNotifierModel product) {
//     product.quantity--;
//     notifyListeners();
//   }

//   double get total {
//     double total = 0;
//     for (var product in cartproducts) {
//       total += product.price * product.quantity;
//     }
//     return total;
//   }


//   int get totalItems {
//     int total = 0;
//     for (var product in cartproducts) {
//       total += product.quantity;
//     }
//     return total;
//   }



//   void clearCart() {
//     cartproducts.clear();
//     notifyListeners();
//   }





// }



