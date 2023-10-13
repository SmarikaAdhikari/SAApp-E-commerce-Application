// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:app/publisher/api/api.service.dart';
import 'package:app/publisher/trial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nb_utils/nb_utils.dart';

class OrderedPage extends ConsumerStatefulWidget {
  const OrderedPage({super.key});

  @override
  ConsumerState<OrderedPage> createState() => _OrderedPageState();
}

class _OrderedPageState extends ConsumerState<OrderedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(pubOrderProvider);

    String dropdownValue = 'Ordered List';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ordered Lists"),

      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: const [
                Tab(
                  // icon: Icon(Icons.list_outlined),
                  text: "Ordered List",
                ),
                Tab(
                  // icon: Icon(Icons.credit_card),
                  text: "Shipped",
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
              child: TabBarView(controller: _tabController, children: [
                details.when (
                  data: (data) =>  
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, position) {
                      return trial(
                        data[position],
                        data[position].userId,
                        data[position].status,
                      
                        data[position].price.toString(),
                        ref,
                       
                       
                      
                               
                
                          );
                    },
                  ),
                  error: (Object error, StackTrace stackTrace) {
                    return const Card();
                  },
                  loading: () => const CircularProgressIndicator(),
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, position) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "User name-",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                           
                                Text(
                                  "Payment Status",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Total Payment",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    // return   trial();
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
