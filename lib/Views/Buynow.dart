import 'package:flutter/material.dart';

class Pagethree extends StatefulWidget {
  const Pagethree({super.key});

  @override
  State<Pagethree> createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
  final ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Card(
              child: Row(
                children: [
                  Image.asset(
                    "pics/north.jpeg",
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text("Name", style: TextStyle(fontSize: 15)),
                      Text("Price", style: TextStyle(fontSize: 15)),
                      Text("Quality", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Order Summary',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ExpansionTile(
              controller: controller,
              title: TextButton(
                  onPressed: () {
                    ExpansionTileController();
                  },
                  child: const Text(
                    'Payment Method',
                    style: TextStyle(color: Colors.black),
                  )),
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(24),
                  child: const Text('E-payment'),
                ),
                Divider(color: Colors.grey.shade400, height: 1.0),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(24),
                  child: const Text('Cash on delivery'),
                ),
                Divider(color: Colors.grey.shade400, height: 1.0),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(24),
                  child: const Text('Pay on pickup'),
                ),
              ],
            ),

            // Column(
            //   children: [
            //       ListTile(
            //         onTap: () {},
            //         title: Text("Order Summary",
            //                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            //       ),
            //     Text("E-payment"),
            //     Text("Cash on delivery"),
            //     Text("Pay on pickup"),
            //   ],
            // ),
            // Text("Bank Details",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Column(
            //   children: [
            //     TextFormField(
            //       decoration: const InputDecoration(
            //           hintText: "Account holder name",
            //           hintStyle: TextStyle(color: Colors.black, fontSize: 18),
            //           border: InputBorder.none),
            //     ),
            //     TextFormField(
            //       decoration: const InputDecoration(
            //           hintText: "Account Number",
            //           hintStyle: TextStyle(color: Colors.black, fontSize: 18),
            //           border: InputBorder.none),
            //     ),
            //   ],
            // ),
            // Text("Total Cost",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Text("Price of the book"),
            //         TextFormField(
            //           decoration:
            //               const InputDecoration(border: InputBorder.none),
            //         ),
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Text("Shipping Cost"),
            //         TextFormField(
            //           decoration:
            //               const InputDecoration(border: InputBorder.none),
            //         ),
            //       ],
            //     ),
            //     Row(children: [
            //       Text("Total Cost"),
            //       TextFormField(),
            //     ]),
            //     TextButton(
            //       onPressed: () {},
            //       child: Text("Buy Now"),
            //     )
            //   ],
            // ),
          ]),
        ));
  }
}
