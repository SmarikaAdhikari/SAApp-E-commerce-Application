import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
 with SingleTickerProviderStateMixin 
 {
   TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom:50),
                  child: Container(
                    height: 150,
                    color: Colors.blue,
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
           const  SizedBox(),
           const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(
                  "Username:",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Smarika",
                  style: TextStyle(color: Colors.black),
                ),
              ],
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
      TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: const [
                 Tab(
                  icon: Icon(Icons.bookmark_added),
                ),
                Tab(
                  icon: Icon(Icons.credit_card),  
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
      ),
            Expanded(
              child: TabBarView( 
                controller: _tabController,
                children: [const Text('Reading list'), const Text('My Orders')],
              ),
            ),
      ], ),
     ),
    ); 
  }
}