import 'package:flutter/material.dart';

class Trendingscreen extends StatefulWidget {
  const Trendingscreen({super.key});

  @override
  State<Trendingscreen> createState() => _TrendingscreenState();
}

class _TrendingscreenState extends State<Trendingscreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: Text("Trending"),
    ));
  }
}
