import 'package:app/api_all/Auth/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class UpdateIpPage extends ConsumerStatefulWidget {
  const UpdateIpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateIpPageState();
}

class _UpdateIpPageState extends ConsumerState<UpdateIpPage> {
  final addressEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressEditingController.text = getStringAsync(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addressEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'IP Address',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await setValue(address, addressEditingController.text);
                Fluttertoast.showToast(msg: "Updated Successfully");
              },
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
