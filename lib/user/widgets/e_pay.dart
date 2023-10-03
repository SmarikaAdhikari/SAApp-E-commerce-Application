import 'package:flutter/material.dart';

Widget epay(){
  return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price of the books:",
                                style: TextStyle(fontSize: 16)),
                            Text("Rs 2500", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                       const  SizedBox( height: 10),
                        Divider(color: Colors.grey.shade400, height: 1),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping Cost:",
                                style: TextStyle(fontSize: 16)),
                            Text("Rs 2500", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        const  SizedBox( height: 10),
                        Divider(color: Colors.grey.shade400, height: 1),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Cost:",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Rs 2500", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ]),
                ),
              );







}