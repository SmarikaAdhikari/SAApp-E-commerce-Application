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

   body:ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: favouriteWidget(),
              ),
            );
          },
          
          itemCount: 15,
        ),





    );
  }
}