// ignore_for_file: file_names

import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/payment_summary.dart';

class Pagethree extends ConsumerWidget {
  ExpansionTileController expansionTileController = ExpansionTileController();
  Pagethree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expansionStateProvider =
        StateNotifierProvider<ExpansionStateNotifier, String>((ref) {
      return ExpansionStateNotifier();
    });
    // ignore: unused_local_variable
    final paymentData = ref.watch(expansionStateProvider);

    // final expansionStateProvider =
    //     ref.watch(StateNotifierProvider((ref) => ExpansionStateNotifier()));
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    color: mainColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(children: [
                        Image.asset(
                          "pics/north.jpeg",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text("Name:", style: TextStyle(fontSize: 15)),
                            Text("Price:", style: TextStyle(fontSize: 15)),
                            Text("Quality:", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ]),
                    ),
                  );
                },
              ),
              // const Spacer(),
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
                    controller: expansionTileController,
                    title: Text(ref.watch(paymentProvider).payment,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    children: [
                      ListTile(
                        onTap: () {
                          ref
                              .read(paymentProvider.notifier)
                              .setPayment('E-payment');

                          expansionTileController.collapse();
                        },
                        title: const Text('E-payment'),
                      ),
                      ListTile(
                        onTap: () {
                          // print(paymentData);
                          ref
                              .read(paymentProvider.notifier)
                              .setPayment('Cash on delivery');
                          expansionTileController.collapse();
                        },
                        title: const Text('Cash on delivery'),
                      ),
                    ],
                  ),
                ),
              ),

              //  ExpansionTile(
              //   title: const Text(
              //     'Select Payment Method',
              //     style: TextStyle(color: Colors.grey),
              //   ),
              //   children: <Widget>[
              //     Container(
              //       alignment: Alignment.center,
              //       padding: const EdgeInsets.all(5),
              //       child: TextButton(
              //           onPressed: () {},
              //           child: const Text('E-payment',
              //               style: TextStyle(color: Colors.black))),
              //     ),
              //     Divider(color: Colors.grey.shade400, height: 0.5),
              //     Container(
              //       alignment: Alignment.center,
              //       padding: const EdgeInsets.all(5),
              //       child: TextButton(
              //           onPressed: () {},
              //           child: const Text('Cash on delivery',
              //               style: TextStyle(color: Colors.black))),
              //     ),
              //     Divider(color: Colors.grey.shade400, height: 0.5),
              //     Container(
              //       alignment: Alignment.center,
              //       padding: const EdgeInsets.all(5),
              //       child: TextButton(
              //           onPressed: () {},
              //           child: const Text('Pay on pickup',
              //               style: TextStyle(color: Colors.black))),
              //     ),
              //   ],
              // ),

              const Text("Total Cost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Card(
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
              ),
              ElevatedButton(
                // ignore: deprecated_member_use
                style: ElevatedButton.styleFrom(primary: mainColor),
                onPressed: () {},
                child: const Text("Place Order",
                    style: TextStyle(color: Colors.black)),
              )
            ]),
          ),
        ));
  }
}
