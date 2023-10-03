
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../api_all/api_cart/api_service.dart';
import '../widgets/search.dart';


class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  // ignore: prefer_final_fields
  // TextEditingController _textEditingController = TextEditingController();
  dynamic titlevalue;

  @override
  Widget build(BuildContext context) {
    // final searchdata = ref.watch(searchProvider(titlevalue));
    final searchdata = ref.watch(
        searchProvider(titlevalue.toString().isEmpty ? null : titlevalue));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // const SizedBox( height: 10,),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  titlevalue = value;
                });
              },

              // controller: _textEditingController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                  hintText: "what are you looking for?",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: InputBorder.none),
            ),
            const SizedBox(
              height: 10,
            ),
            searchdata.when(
              data: (data) => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return searchWidget(
                      data[index],
                      data[index].id.toString(),
                      ref,
                    );
                  },
                ),
              ),
              error: (Object error, StackTrace stackTrace) {
                return const Center();
              },
              loading: () {
                return const Center();
              },
            ),
          ],
        ),
      ),
    );
  }

  //   @override
  // void dispose() {
  //   _textEditingController.dispose();
  //   super.dispose();
  // }
}
