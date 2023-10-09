// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:app/publisher/publish.dart';
import 'package:app/user/Views/buynow%20.dart';
import 'package:app/user/pages/favoritepage.dart';
import 'package:app/user/pages/firstpage.dart';
import 'package:app/user/pages/loginpage.dart';
import 'package:app/user/pages/profilepage.dart';
import 'package:app/user/pages/genrepage.dart';
import 'package:app/user/pages/searchpage.dart';
import 'package:app/user/screens/bestsellers.dart';
import 'package:app/user/screens/newreleases.dart';
import 'package:app/user/screens/popularauthors.dart';
import 'package:app/user/screens/routes.dart';
import 'package:app/user/screens/trendingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'user/api_all/Auth/constants.dart';
import 'user/api_all/api_cart/api_service.dart';
// import 'package:badges/badges.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const RestartAppTry());
}

class MyApp extends StatelessWidget {
   MyApp({super.key,  this.isLogin});
   bool? isLogin;

  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 174, 211, 241)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:
          // '/publish',
          isLogin == null
              ? '/login'
              : !isLogin!
                  ? '/welcome'
                  : '/home',
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
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navProvider);
    final token = getStringAsync(accessToken);
    final details = ref.watch(cartProvider);
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
          Visibility(
            visible: token.isEmptyOrNull ? true : false,
            child: Column(
              children: [
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(() => const LoginPage());
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.exit_to_app)),
                      const Text(
                        "Log in",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // const Divider(),
          Visibility(
            visible: token.isEmptyOrNull ? false : true,
            child: Column(
              children: [
                const Divider(),
                InkWell(
                  onTap: () async {
                    await setValue(accessToken, '');
                    RestartAppTry.isL = true;
                    Get.reset();
                    // ignore: use_build_context_synchronously
                    RestartAppTry.init(context);
                    _googleSignIn.signOut();
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.exit_to_app)),
                      const Text(
                        "Log out",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
            InkWell(
            onTap: () => Get.to(() => const PublishPage()),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.book)),
                const Text(
                  "Publish",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Divider()

          
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
                  MaterialPageRoute(builder: (context) => (const CartPage())));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
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
        iconSize: 25,
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
  static bool? isL = false;

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
          isLogin: RestartAppTry.isL,
        ),
      ),
    );
  }
}
