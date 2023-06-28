import 'package:app/app_states/nav_states/nav_notifier.dart';
import 'package:app/pages/favoritepage.dart';
import 'package:app/pages/firstpage.dart';
import 'package:app/pages/profilepage.dart';
import 'package:app/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final screens = [
    const Firstpage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navProvider).index;
    return Scaffold(
      drawer: const Drawer(
        //
        key: Key("E-library"),
        backgroundColor: Color.fromARGB(255, 190, 229, 247),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 80,
              child: Row(
                children: [
                  Icon(Icons.trending_up),
                  Text(
                    "Trending Books",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
          SizedBox(
              height: 80,
              child: Row(
                children: [
                  Icon(Icons.star_border),
                  Text(
                    "Best Sellers",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
          SizedBox(
              height: 80,
              child: Row(
                children: [
                  Icon(Icons.book_sharp),
                  Text(
                    "New Releases",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
          SizedBox(
              height: 80,
              child: Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    "Popular Authors",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
        ]),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "E-library",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notification_add,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      //this is for learning only
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: ref.watch(navProvider).index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: (value) {
          ref.read(navProvider.notifier).onIndexChanged(value);
        },
        elevation: 5,
        backgroundColor: Colors.black,
      ),
    );
  }
}
