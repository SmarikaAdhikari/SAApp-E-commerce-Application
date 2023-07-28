// import 'package:app/main.dart';
// import 'package:app/Views/enumlist.dart';
import 'package:app/widgets/drawerWidget.dart';
// import 'package:app/widgets/favouritewidget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../widgets/genrelist.dart';

class Trendingscreen extends StatefulWidget {
  const Trendingscreen({super.key});

  @override
  State<Trendingscreen> createState() => _TrendingscreenState();
}

class _TrendingscreenState extends State<Trendingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: drawerWidget(),
                ),
              );
            },
            itemCount: 15,
          ),
        ));
  }
}
