// ignore_for_file: non_constant_identifier_names, unused_local_variable

// import 'package:app/api_user/api_user_service.dart';
import 'package:app/screens/edits.dart';
// import 'package:app/widgets/bio.dart';
// import 'package:app/widgets/date.dart';
import 'package:app/widgets/favouritewidget.dart';
// import 'package:app/widgets/new.dart';
import 'package:app/widgets/profileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
import 'package:get/get.dart';

import '../api_all/api_user/api_user_provider.dart';
// import '../widgets/constants.dart';
import '../widgets/orderwidget.dart';

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
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 50),
              child:
              Image.asset(
                "pics/daisy.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 130,)
              //  Container(
              //   height: 120,
              //   color: const Color.fromARGB(255, 170, 208, 239),
              // ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("pics/daisy.jpeg"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            ApiService.when(
                data: (data) => profileWidget(
                     data
                    ),
                error: (Object error, StackTrace stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return const CircularProgressIndicator();
                }),
                const Spacer(),
          ElevatedButton(
            onPressed: () {
            Get.to(() => Edits());
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

        // Row(children: [
        //   Expanded(
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           StreamBuilder<String>(
        //               stream: newcontroller.stream,
        //               builder: (context, snapshot) {
        //                 if (snapshot.hasData) {
        //                   return Text(
        //                     snapshot.data.toString(),
        //                     style: const TextStyle(
        //                         fontWeight: FontWeight.bold, fontSize: 15),
        //                   );
        //                 } else {
        //                   return const Text(
        //                     "---",
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold, fontSize: 15),
        //                   );
        //                 }
        //               }),
        //           StreamBuilder<String>(
        //               stream: biocontroller.stream,
        //               builder: (context, snapshot) {
        //                 if (snapshot.hasData) {
        //                   return Text(
        //                     snapshot.data.toString(),
        //                     style: const TextStyle(fontSize: 15),
        //                   );
        //                 } else {
        //                   return const Text(
        //                     "---",
        //                     style: TextStyle(fontSize: 15),
        //                   );
        //                 }
        //               }),
        //           Row(
        //             children: [
        //               const Icon(
        //                 Icons.calendar_month_outlined,
        //                 size: 15,
        //               ),
        //               const Text(
        //                 "Joined Date:",
        //                 style: TextStyle(fontSize: 15),
        //               ),
        //               // StreamBuilder<String>(
        //               //     stream: datecontroller.stream,
        //               //     builder: (context, snapshot) {
        //               //       if (snapshot.hasData) {
        //               //         return Text(
        //               //           snapshot.data.toString(),
        //               //           style: const TextStyle(fontSize: 15),
        //               //         );
        //               //       } else {
        //               //         return const Text(
        //               //           "---",
        //               //           style: TextStyle(fontSize: 15),
        //               //         );
        //               //       }
        //               //     }),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),

        SizedBox(
          height: 60,
          child: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                icon: Icon(Icons.bookmark_added),
                text: "Reading List",
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
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(child: favouriteWidget());
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(child: orderWidget());
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
