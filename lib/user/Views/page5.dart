import 'package:app/user/widgets/trial.dart';
import 'package:flutter/material.dart';

class TryPage extends StatefulWidget {
  const TryPage({super.key});

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
         
        itemBuilder:  (context, index) {
        return ExpansionTile(title: Card(
          child: Column(
            children: [
              trial(),
              const Icon(Icons.add),
              Text("New $index"),
            ],
          ),
        ),
        onExpansionChanged: (value) {
          if(value) {
            // print("Expanded");
          } else {
            // print("Collapsed");
          }
        },

        children: [
          ListView.builder(
             shrinkWrap: true,
            itemCount: 3,
            itemBuilder:  (context, index) => Card(
            child: ListTile(
              title: Column(
                children: [
                  trial(),
                  const Text("Old"),
                ],
              ),
            ),
          
          ),)
        ],
        );
      },)
    );
  }
}
