// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

// import 'package:app/widgets/read.dart';
import 'package:app/api_all/api_book/api_provider.dart';
import 'package:app/widgets/e_pay.dart';
import 'package:app/widgets/orderwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/payment_summary.dart';

final cartProvider = StateProvider<int>((ref) => 0);

class BuyNow extends ConsumerWidget {
  ExpansionTileController expansionTileController = ExpansionTileController();
  BuyNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expansionStateProvider =
        StateNotifierProvider<ExpansionStateNotifier, String>((ref) {
      return ExpansionStateNotifier();
    });
    // ignore: unused_local_variable
    final paymentData = ref.watch(expansionStateProvider);
    final CartProvider = ref.watch(cartFutureProvider);
    // ignore: unused_local_variable
    final value = ref.watch(cartProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Payment Summary  ")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
            child: Column(children: [
              SizedBox(
                height: 350,
                child: CartProvider.when(
                    data: (data) => ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: orderWidget(
                                  data[index],
                                  data[index].id.toString(),
                                  ref,
                                ),
                              ),
                            );
                          },
                          itemCount: data.length,
                        ),
                    error: (Object error, StackTrace stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
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
                      Divider(color: Colors.grey.shade400, height: 1),
                      ListTile(
                        onTap: () {
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
              const SizedBox(
                height: 10,
              ),
              const Text("Total Cost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              epay(),
              ElevatedButton(
                // ignore: deprecated_member_use
                style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
                onPressed: () {},
                child: const Text("Place Order",
                    style: TextStyle(color: Colors.black)),
              )
            ]),
          ),
        ));
  }
}
