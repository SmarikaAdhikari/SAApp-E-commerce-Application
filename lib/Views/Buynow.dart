// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Pagethree extends StatefulWidget {
  const Pagethree({super.key});

  @override
  State<Pagethree> createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
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
                    const SizedBox(width: 30),
                    const Column(
                      children: [
                        Text("Name:", style: TextStyle(fontSize: 15)),
                        Text("Price:", style: TextStyle(fontSize: 15)),
                        Text("Quality:", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Order Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      'Select Payment Method',
                      style: TextStyle(color: Colors.grey),
                    ),
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('E-payment',
                                style: TextStyle(color: Colors.black))),
                      ),
                      Divider(color: Colors.grey.shade400, height: 0.5),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Cash on delivery',
                                style: TextStyle(color: Colors.black))),
                      ),
                      Divider(color: Colors.grey.shade400, height: 0.5),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Pay on pickup',
                                style: TextStyle(color: Colors.black))),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Total Cost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const Text("Price of the book:",
                        style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey.shade400, height: 1),
                    const SizedBox(height: 20),
                    const Text("Shipping Cost:",
                        style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey.shade400, height: 1),
                    const SizedBox(height: 20),
                    const Text("Total Cost:", style: TextStyle(fontSize: 15)),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Place Order",
                    style: TextStyle(color: Colors.black)),
              )
            ]),
          ),
        ));
  }
}
