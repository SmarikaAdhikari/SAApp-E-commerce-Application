import 'package:app/pages/firstpage.dart';
// import 'package:app/widgets/trial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/trial.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key}); 

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    // ignore: prefer_final_fields
    TextEditingController _textEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          ElevatedButton(
          onPressed: () => Get.to(() => const Firstpage()),
           child: TextFormField(
                  
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                      hintText: "what are you looking for?",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: InputBorder.none),
                ),
         ),
        
       Flexible(
         child: ListView.builder( itemCount:10,
         scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
         itemBuilder:   (context, index) => trial(),
          ),
       ),
         
        ],
      ),
      );
  }


    @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}