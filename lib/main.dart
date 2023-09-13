// import 'package:app/Views/listgenre.dart';
import 'package:app/Views/Buynow.dart';
import 'package:app/api_all/api_book/cart_model.dart';
import 'package:app/pages/favoritepage.dart';
import 'package:app/pages/firstpage.dart';
import 'package:app/pages/profilepage.dart';
import 'package:app/pages/genrepage.dart';
import 'package:app/pages/searchpage.dart';
import 'package:app/screens/bestsellers.dart';
import 'package:app/screens/newreleases.dart';
import 'package:app/screens/popularauthors.dart';
import 'package:app/screens/routes.dart';
import 'package:app/screens/trendingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'api_all/Auth/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initialize();

  Hive.registerAdapter(CartNotifierModelAdapter());
  await Hive.openBox<CartNotifierModel>('cart');
  runApp(const RestartAppTry());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 174, 211, 241)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: !isLogin ? '/welcome' : '/home',
      getPages: pages,
    );
  }
}

final navProvider = StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final screens = [
    const Firstpage(),
    const GenrePage(),
    const SearchPage(),
    const FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navProvider);
    return Scaffold(
      drawer: Drawer(
        key: const Key("E-library"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: Colors.blue,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
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
          ),
          const Divider(),
          InkWell(
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
          ),
          const Divider(),
          InkWell(
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
          ),
          const Divider(),
          InkWell(
            onTap: () => Get.to(() => const Popularauthors()),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                const Text(
                  "Popular Authors",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () async {
              await setValue(accessToken, '');

              RestartAppTry.isL = true;
              Get.reset();
              // ignore: use_build_context_synchronously
              RestartAppTry.init(context);
            },
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
                const Text(
                  "Log out",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Divider(),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (BuyNow())));
            },
            icon: const Icon(Icons. shopping_cart_outlined),
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
            icon: Icon(Icons.menu_book_sharp),
            label: 'Genre',
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
          ref.read(navProvider.notifier).update((state) => value);
        },
        elevation: 6,
        backgroundColor: Colors.black,
      ),
    );
  }
}

/// RestartAppWidget
class RestartAppTry extends StatefulWidget {
  static bool isL = false;

  const RestartAppTry({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RestartAppTryState createState() => _RestartAppTryState();

  static init(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppTryState>()?.restartApp();
  }
}

class _RestartAppTryState extends State<RestartAppTry> {
  Key _key = UniqueKey();
  void restartApp() {
    _key = UniqueKey();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => KeyedSubtree(
      key: _key,
      child: ProviderScope(
          child: MyApp(
        isLogin: RestartAppTry.isL,
      )));
      void main() {
  runApp(
    ProviderScope(
      child: MyApp(
        isLogin: RestartAppTry.isL ,
      ),
      
    ),
  );
}
}