import 'package:app/user/pages/signup.dart';
import 'package:app/user/widgets/Try/loginfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api_all/Auth/login_repo.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late GoogleSignInAccount userObj;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 174, 211, 241),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              const Image(
                  image: AssetImage('view/BSS.png'), height: 150, width: 200),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 243, 252),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
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
                  controller: passwordController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password.';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(loginServiceProvider).login(
                        emailController.text, passwordController.text, context);
                  }
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'view/googlelogo.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text("Login with Google"),
                      ],
                    ),
                    onPressed: () {
                      _googleSignIn.signIn().then((userData) {
                        ref
                            .read(loginServiceProvider)
                            .login(userData!.email, '123456', context)
                            .then((value) {
                          if (value == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginFieldPage(
                                      userData.photoUrl!,
                                      userData.displayName!,
                                      userData.email),
                                ));
                          }
                        }).catchError((e) {
                          print("33de: $e");
                        });
                      });
                    }),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.blue[900], fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Signup',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
