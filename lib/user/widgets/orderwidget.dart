
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../api_all/api_cart/api_model.dart';


// final cartProvider = StateProvider<int>((ref) => 0);
// Widget orderWidget(
//   CartModel data,
//   String id,
//   WidgetRef ref,
  

// ) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         data.book.image == null
//             ? Image.asset(
//                 "pics/daisy.jpeg",
//                 height: 120,
//                 width: 100,
//               )
//             : CachedNetworkImage(
//                 imageUrl: data.kitab.image,
//                 height: 120,
//                 width: 100,
//               ),
//         const SizedBox(width: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(data.kitab.title),
//             Text(data.kitab.price.toString()),
//           ],
//         ),
//         const Spacer(),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(9),
//             color: const Color.fromARGB(255, 255, 255, 255),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromARGB(60, 0, 0, 0),
//                 offset: Offset(0, 5),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // ref.read(cartStateProvider.notifier).increment(data);
//                   ref.read(cartProvider.notifier).state++;
//                 },
//                 icon: const Icon(Icons.add),
//               ),
//               const Text("1"),
//               IconButton(
//                 onPressed: () {
                
//                   // ref.read(cartStateProvider.notifier).decrement(data);
//                   ref.read(cartProvider.notifier).state--;
//                 },
//                 icon: const Icon(Icons.remove),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }





