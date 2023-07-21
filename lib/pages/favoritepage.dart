import 'package:app/widgets/favouritewidget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          left: 8.0,
        ),
        child: 
        ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: favouriteWidget(),
              ),
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
