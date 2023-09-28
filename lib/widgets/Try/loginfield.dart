import 'package:app/api_all/Auth/login_repo.dart';
import 'package:app/api_all/Auth/signup_repo.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginFieldPage extends ConsumerStatefulWidget {
  const LoginFieldPage(this.image, this.name, this.email, {super.key});
  final String image;
  final String name;
  final String email;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFieldPageState();
}

class _LoginFieldPageState extends ConsumerState<LoginFieldPage> {
  bool isCheck = false;
  final bioEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final locationEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            _googleSignIn.signOut().then((value) {
              RestartAppTry.isL = null;
              Get.reset();
              RestartAppTry.init(context);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 211, 241),
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Switch Account",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            const Image(
                image: AssetImage('view/BSS.png'), height: 150, width: 200),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 243, 252),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: phoneEditingController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    labelText: 'Phone no.'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.equalLength(10),
                ]),
                onSaved: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 243, 252),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: locationEditingController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    labelText: 'Location'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                onSaved: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 243, 252),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                maxLines: 2,
                controller: bioEditingController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: 'Bio'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(5),
                ]),
                onSaved: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isCheck,
                  onChanged: (value) {
                    setState(() {
                      isCheck = !isCheck;
                    });
                  },
                ),
                const Text('I am publisher'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref
                      .read(signUpServiceProvider)
                      .signUp(
                          widget.name,
                          widget.email,
                          phoneEditingController.text,
                          '123456',
                          locationEditingController.text,
                          bioEditingController.text,
                          isCheck,
                          widget.image)
                      .then((value) {
                    ref
                        .read(loginServiceProvider)
                        .login(widget.email, '123456', context);
                  });
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
