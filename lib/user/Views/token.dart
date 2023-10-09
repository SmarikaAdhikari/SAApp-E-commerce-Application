// import 'package:app/user/pages/signup.dart';
// ignore_for_file: unused_local_variable

// import 'package:app/user/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';

import '../api_all/Auth/signup_repo.dart';
import '../api_all/api_user/api_user_model.dart';
import '../api_all/api_user/api_user_service.dart';

class TokenPage extends ConsumerStatefulWidget {
  const TokenPage(this.signupData, {super.key});
final SignupModel signupData;
  @override
  ConsumerState<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends ConsumerState<TokenPage> {
   bool isCheck = false;
   
    final otpEditingController = TextEditingController();
    final formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
   final data = ref.watch(verifyServiceProvider);
   return Scaffold(
        backgroundColor: const Color.fromARGB(255, 147, 201, 245),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 200),
                const Text("Verification Code",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 49, 49, 49))),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child:  Pinput(
                      controller:  otpEditingController,
                      length: 6,
                      forceErrorState: true,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
     
                      ref
                          .read(verifyServiceProvider)
                          .verifyotp(widget.signupData.email, otpEditingController.text).then((value) {
                            if(value == 200){
                              Fluttertoast.showToast(msg: "Registered Successfully");

                                 ref
                          .read(signUpServiceProvider)
                          .signUp(
                            widget.signupData);
                            }
                          });
                  //  Get.toNamed('/login');
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ));
  }
}