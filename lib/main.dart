import 'package:app/pages/favoritepage.dart';
import 'package:app/pages/firstpage.dart';
import 'package:app/pages/profilepage.dart';
import 'package:app/pages/searchpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    const Firstpage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage()
  ];

void onItemTapped(int index){
  setState(() {
    currentIndex = index;
  });
}
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      
     drawer: const Drawer(
    
     ),
      appBar: AppBar(
        title: const Text("E-library",style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [ IconButton(
      icon: const Icon(
        Icons.notification_add,
        color: Colors.black,
        ),
      onPressed: () {
      
          },
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
        onTap: onItemTapped,  
        elevation: 5  ,
        backgroundColor: Colors.black,

      ),  
    );  

    
  





  
  }
}
