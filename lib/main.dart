// import 'package:app/Views/Buynow.dart';
import 'package:app/Views/listgenre.dart';
import 'package:app/app_states/nav_states/nav_notifier.dart';
import 'package:app/pages/favoritepage.dart';
import 'package:app/pages/firstpage.dart';
import 'package:app/pages/profilepage.dart';
import 'package:app/pages/searchpage.dart';
import 'package:app/screens/bestsellers.dart';
import 'package:app/screens/newreleases.dart';
import 'package:app/screens/popularauthors.dart';
import 'package:app/screens/trendingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'pages/loginpage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 174, 211, 241)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Loginpage(),
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
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navProvider).index;
    return Scaffold(
      drawer: Drawer(
        key: const Key("E-library"),
        backgroundColor: const Color.fromARGB(255, 190, 229, 247),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => Get.to(() => const Trendingscreen()),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.trending_up)),
                    const Text(
                      "Trending",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
          SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => Get.to(() => const Bestsellers()),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
                    const Text(
                      "Best Sellers",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
          SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => Get.to(() => const Newreleases()),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.book)),
                    const Text(
                      "New Releases",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )),
          SizedBox(
              height: 80,
              child: InkWell(
                onTap: () => Get.to(() => const Popularauthors()),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.person)),
                    const Text(
                      "Popular Authors",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Pagetwo()));
            },
            icon: const Icon(Icons.person_2_outlined),
          )
        ],
      ),
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
        currentIndex: currentIndex,
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
