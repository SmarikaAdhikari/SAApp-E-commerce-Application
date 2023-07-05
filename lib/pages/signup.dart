import 'package:app/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _phone_no;
  late String _password;
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 211, 241),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 174, 211, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image(image: AssetImage('view/BSS.png'), height: 150, width: 200),
              SizedBox(
                height: 10,
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(15),
                  ]),
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
                      labelText: 'E-mail'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                  onSaved: (value) {
                    _email = value!;
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
                      labelText: 'Phone no.'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.minLength(10),
                  ]),
                  onSaved: (int) {
                    _phone_no = int!;
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(5),
                  ]),
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
                    'Submit',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => const Loginpage());
                    _formKey.currentState?.save();

                    print('Name: $_name');

                    print('E-mail: $_email');

                    print('Password: $_password');
                    print('Password: $_phone_no');
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
