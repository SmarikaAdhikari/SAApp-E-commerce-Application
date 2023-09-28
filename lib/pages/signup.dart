import 'package:app/api_all/Auth/signup_repo.dart';
import 'package:app/pages/update_ip_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final bioEditingController = TextEditingController();

  final locationEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 174, 211, 241),
          elevation: 0,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateIpPage(),
                    ));
              },
              child: const Text("Update IP"),
            ),
            const SizedBox(width: 10)
          ]),
      backgroundColor: const Color.fromARGB(255, 174, 211, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
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
                  controller: nameEditingController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'Name'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(15),
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
                  controller: emailEditingController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'E-mail'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
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
                  controller: passwordEditingController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      labelText: 'Password'),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(5),
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
                            nameEditingController.text,
                            emailEditingController.text,
                            phoneEditingController.text,
                            passwordEditingController.text,
                            locationEditingController.text,
                            bioEditingController.text,
                            isCheck,
                            null
                            )
                        .then((value) {
                      nameEditingController.clear();
                      emailEditingController.clear();
                      phoneEditingController.clear();
                      passwordEditingController.clear();
                      locationEditingController.clear();
                      bioEditingController.clear();
                      isCheck = false;
                    });
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
