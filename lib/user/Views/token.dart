// import 'package:app/user/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                      // validator: (pin) {
                      //   if (pin == emailEditingController) 
                      //   {
                      //     return 'Success';
                      //   }
                        
                        
                      //   else{
                      //     return 'Pin is incorrect';
                      //   }

                      
                      // },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Get.to(() => const LoginPage());
 
                      ref
                          .read(verifyServiceProvider)
                          .verifyotp(widget.signupData.email, otpEditingController.text).then((value) {
                            if(value == 200){
                                 ref
                          .read(signUpServiceProvider)
                          .signUp(
                            widget.signupData);
                            }
                          });
                

                   
                          
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