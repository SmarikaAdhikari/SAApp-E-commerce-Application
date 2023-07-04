import 'package:app/screens/edits.dart';
import 'package:app/widgets/bio.dart';
import 'package:app/widgets/date.dart';
import 'package:app/widgets/new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../widgets/bio.dart';

class ProfilePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  // StreamController<String> streamController = StreamController<String>();
  // TextEditingController textEditingController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 50),
              child: Container(
                height: 120,
                color: Colors.blue[100],
              ),
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
        Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<String>(
                      stream: newcontroller.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          );
                        } else {
                          return const Text(
                            "---",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          );
                        }
                      }),
                  StreamBuilder<String>(
                      stream: biocontroller.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.toString(),
                            style: const TextStyle(fontSize: 15),
                          );
                        } else {
                          return const Text(
                            "---",
                            style: TextStyle(fontSize: 15),
                          );
                        }
                      }),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 15,
                      ),
                      const Text(
                        "Joined Date:",
                        style: TextStyle(fontSize: 15),
                      ),
                      StreamBuilder<String>(
                          stream: datecontroller.stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data.toString(),
                                style: const TextStyle(fontSize: 15),
                              );
                            } else {
                              return const Text(
                                "---",
                                style: TextStyle(fontSize: 15),
                              );
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Edits());
              },
              child: const Text("Edits"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[100],
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              )),
        ]),

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
          ),
        ),
        //   ],
        // ),
      ]),
    ));
  }
}
