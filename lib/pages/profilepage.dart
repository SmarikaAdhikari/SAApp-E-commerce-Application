import 'package:app/screens/edits.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
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
        SizedBox(height: 10),
        Row(children: [
          Column(
            children: [
              Text(
                "Username:",
                style: TextStyle(color: Colors.black),
              ),
              const Text(
                "Bio:",
                style: TextStyle(fontSize: 15),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 15,
                  ),
                  Text(
                    "Joined Date:",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 220),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Edits());
              },
              child: Text("Edits"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[100],
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              )),
        ]),

        TabBar(
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
        //   ],
        // ),
      ]),
    ));
  }
}
