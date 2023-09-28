// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'package:app/pages/edits.dart';
import 'package:app/widgets/read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../api_all/api_book/api_provider.dart';
import '../api_all/api_cart/api_service.dart';
import '../api_all/api_user/api_user_provider.dart';
import '../widgets/profileWidget.dart';

class ProfilePage extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ApiService = ref.watch(userFutureProvider);
    final ReadProvider = ref.watch(readFutureProvider);
    final details = ref.watch(orderProvider);
    return Scaffold(
      body: SafeArea(
        child: ApiService.when(
          data: (data) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 50),
                  child: Image.asset(
                    "pics/daisy.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 130,
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                child: data.image == null
                    ? const CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("pics/daisy.jpeg"),
                      )
                    : CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(data.image),
                      ),
              ),
            ]),
            const SizedBox(height: 10),
            ApiService.when(
              data: (data) => Row(
                children: [
                  profileWidget(data),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => Edits(
                            // image: data.image,
                            name: data.name,
                            bio: data.bio.toString(),
                            email: data.email,
                            password: data.password,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: const Text("Edits"),
                  ),
                ],
              ),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 60,
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.bookmark_added),
                    text: "Want to Read",
                  ),
                  Tab(
                    icon: Icon(Icons.credit_card),
                    text: "My Orders",
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ReadProvider.when(
                        data: (data) => ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  child: readWidget(data[index],
                                      data[index].book.id.toString(), ref),
                                );
                              },
                              itemCount: data.length,
                            ),
                        error: (Object error, StackTrace stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () {
                          return const Center();
                        }),
                    details.when(
                      data: (data) => Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                title: Container(
                                  color: Colors.grey[100],
                                  height: 120,
                                  width: 800,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("User: ${data[index].user!.name}"),
                                        Text(
                                          "Order Date: ${data[index].createdAt}",
                                          maxLines: 1,
                                        ),
                                        Text("Total: ${data[index].total}"),
                                        Text("Payment: ${data[index].status}"),
                                      ],
                                    ),
                                  ),
                                ),
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: data[index].orderItem!.length,
                                    itemBuilder: (context, dindex) => Card(
                                      child: ListTile(
                                        horizontalTitleGap: 1,
                                        title: Text(data[index]
                                                .orderItem![dindex]
                                                .book
                                                ?.title ??
                                            ''),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Price : ${data[index].orderItem![dindex].price.toString()}"),
                                            Text(
                                                "Quantity :${data[index].orderItem![dindex].quantity.toString()}"),
                                          ],
                                        ),
                                        // trailing: Text(
                                        //     data[index].orderItem![dindex].status.toString()),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          )),
                      error: (Object error, StackTrace stackTrace) {
                        return const Card();
                      },
                      loading: () {
                        return const Card();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    "Please Login",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: const Text("Login"))
                ],
              ),
            );
          },
          loading: () {
            return const Center();
          },
        ),
      ),
    );
  }
}
