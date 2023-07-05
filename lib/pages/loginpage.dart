import 'package:app/main.dart';
import 'package:app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
  const Loginpage({super.key});
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 174, 211, 241),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image(image: AssetImage('view/BSS.png'), height: 150, width: 200),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 243, 252),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 243, 252),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
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
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => const MyHomePage());
                    _formKey.currentState?.save();

                    print('Name: $_name');

                    print('Password: $_password');
                  }
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.blue[900], fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    onPressed: () => Get.to(() => const Signup()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
