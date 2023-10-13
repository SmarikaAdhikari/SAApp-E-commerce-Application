// ignore_for_file: file_names

import 'package:app/user/api_all/api_cart/api_model.dart';
// import 'package:app/pages/payment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../api_all/api_cart/api_service.dart';
// import '../pages/payment.dart';
import '../provider/payment_summary.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  ExpansionTileController expansionTileController = ExpansionTileController();

  FormGroup cartGroup(List<CartModel> data) {
    return FormGroup({
      'total': FormControl<int>(
        value: 0,
      ),
      // 'payment':
      //     FormControl<int?>(value: ref.watch(paymentProvider).payment),
      'Subtotal': FormControl<int>(
        value: 0,
      ),
      'books': FormArray([for (final qualif in data) bookGroup(qualif)]),
    });
  }

  FormGroup bookGroup(CartModel data) {
    return FormGroup({
      'bookId': FormControl<String>(value: data.bookId),
      'quantity': FormControl<int>(value: 1),
      'price': FormControl<int>(
        value: data.book!.price,
      ),
      'publisherId': FormControl<String>(value: data.publisherId),
      'isChecked': FormControl<bool>(value: false),
    });
  }

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(cartProvider);
    // ignore: unused_local_variable
    final value = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: const Color.fromARGB(255, 165, 182, 190),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              details.when(
                data: (data) {
                  return ReactiveFormBuilder(
                      form: () => cartGroup(data),
                      builder: (context, formGroup, child) {
                        getTotal() {
                          int value = formGroup
                                      .control('books')
                                      .value
                                      .where((element) =>
                                          element['isChecked'] == true)
                                      .length ==
                                  0
                              ? 0
                              : 100;

                          formGroup.control('Subtotal').value = formGroup
                              .control('books')
                              .value
                              .where((element) => element['isChecked'] == true)
                              .fold(
                                  0,
                                  (dynamic prev, dynamic product) =>
                                      prev + product['price']);

                          formGroup.control('total').value =
                              formGroup.control('Subtotal').value + value;

                          setState(() {});
                        }

                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.57,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  productTotal() {
                                    final value = data[index].book!.price! *
                                        formGroup
                                            .control('books.$index.quantity')
                                            .value;

                                    formGroup
                                        .control('books.$index.price')
                                        .value = value;
                                  }

                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed("/bookdetails", arguments: {
                                        "id": data[index].bookId
                                      });
                                    },
                                    child: Card(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          ReactiveCheckbox(
                                            formControlName:
                                                'books.$index.isChecked',
                                            onChanged: (control) {
                                              formGroup
                                                  .control(
                                                      'books.$index.isChecked')
                                                  .value = control.value;

                                              getTotal();
                                            },
                                          ),
                                          data[index].book!.image == null
                                              ? Image.asset(
                                                  "pics/daisy.jpeg",
                                                  height: 60,
                                                  width: 50,
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl:
                                                      data[index].book!.image,
                                                  height: 60,
                                                  width: 50,
                                                ),
                                          SizedBox(
                                              width: 110,
                                              child: Text(
                                                data[index]
                                                    .book!
                                                    .title
                                                    .toString(),
                                              )),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Card(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          formGroup
                                                              .control(
                                                                  'books.$index.quantity')
                                                              .value++;
                                                          productTotal();
                                                          getTotal();
                                                        },
                                                        icon: const Icon(
                                                            Icons.add)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  ReactiveValueListenableBuilder(
                                                    builder: (context,
                                                        controller, child) {
                                                      return Text(controller
                                                          .value
                                                          .toString());
                                                    },
                                                    formControlName:
                                                        'books.$index.quantity',
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Card(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          formGroup
                                                                      .control(
                                                                          'books.$index.quantity')
                                                                      .value-- <=
                                                                  1
                                                              ? formGroup
                                                                  .control(
                                                                      'books.$index.quantity')
                                                                  .value = 1
                                                              : null;
                                                          productTotal();
                                                          getTotal();
                                                        },
                                                        icon: const Icon(
                                                            Icons.remove)),
                                                  ),
                                                ],
                                              ),
                                              ReactiveValueListenableBuilder(
                                                builder: (context, controller,
                                                    child) {
                                                  return Text(
                                                      "Rs: ${controller.value.toString()}");
                                                },
                                                formControlName:
                                                    'books.$index.price',
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Order Summary',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Container(
                              // height: 200,
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1),
                              ),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  controller: expansionTileController,
                                  title: Text(
                                      ref.watch(paymentProvider).payment == null
                                          ? "Choose Payment Method"
                                          : ref
                                                      .watch(paymentProvider)
                                                      .payment ==
                                                  0
                                              ? "E-payment"
                                              : "Cash on delivery",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        ref
                                            .read(paymentProvider.notifier)
                                            .setPayment(0);

                                        expansionTileController.collapse();
                                      },
                                      title: const Text('E-payment'),
                                    ),
                                    Divider(
                                        color: Colors.grey.shade400, height: 1),
                                    ListTile(
                                      onTap: () {
                                        ref
                                            .read(paymentProvider.notifier)
                                            .setPayment(1);
                                        expansionTileController.collapse();
                                      },
                                      title: const Text('Cash on delivery'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                const Text("Product Amount"),
                                const Spacer(),
                                ReactiveValueListenableBuilder(
                                  builder: (context, controller, child) {
                                    return Text(
                                        "Rs: ${controller.value.toString()}");
                                  },
                                  formControlName: 'Subtotal',
                                ),
                              ],
                            ),
                            Visibility(
                              visible: formGroup.control('Subtotal').value == 0
                                  ? false
                                  : true,
                              child: const Row(
                                children: [
                                  Text("Shipping Charge"),
                                  Spacer(),
                                  Text("Rs: 100"),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Text("Total Amount"),
                                const Spacer(),
                                ReactiveValueListenableBuilder(
                                  builder: (context, controller, child) {
                                    return Text(
                                        "Rs: ${controller.value.toString()}");
                                  },
                                  formControlName: 'total',
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    final newGroup = {
                                      "total": formGroup.control('total').value,
                                      "payment":
                                          ref.watch(paymentProvider).payment,
                                      "books": formGroup
                                          .control('books')
                                          .value
                                          .where((element) =>
                                              element['isChecked'] == true)
                                          .toList()
                                    };

                                    if (ref.watch(paymentProvider).payment !=
                                            null &&
                                        formGroup.control('total').value != 0) {
                                      // Get.to(const PaymentPage());
                                      ref
                                          .read(cartRepoProvider)
                                          .postOrder(newGroup)
                                          .then((value) async {
                                        if (value != null) {
                                          final config = ESewaConfig.dev(
                                            scd: "EPAYTEST",
                                              amt: formGroup
                                                  .control('Subtotal')
                                                  .value
                                                  .toDouble(),
                                              tAmt: formGroup
                                                  .control('total')
                                                  .value
                                                  .toDouble(),
                                              pid: value,
                                              su: "https://esewa.com.np/merchant/invoice",
                                              fu: "https://esewa.com.np/merchant/invoice",
                                              pdc: 100);

                                          await Esewa.i.init(
                                              context: context,
                                              eSewaConfig: config);
                                        } else {
                                         Get.back();
                                        }
                                      });
                                    }
                                  },
                                  child: const Text("Place Order")),
                            ),
                          ],
                        );
                      });
                },
                error: (Object error, StackTrace stackTrace) {
                  return const Card();
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
