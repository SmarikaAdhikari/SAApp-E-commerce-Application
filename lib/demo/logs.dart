import 'package:app/demo/trio_service.dart';
// import 'package:app/demo/try.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';

class LogsPage extends ConsumerStatefulWidget {
  const LogsPage({super.key});

  @override
  ConsumerState<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends ConsumerState<LogsPage> {
  final _formKey = GlobalKey<FormState>();

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
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
                  FormBuilderValidators.minLength(6),
                ]),
                onSaved: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
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
                  ref.read(loginProvider).login(emailEditingController.text,
                      passwordEditingController.text, context);
                } 
                // else {
                //   ref.read(loginProvider).login(emailEditingController.text,
                //       passwordEditingController.text, context);
                //   final snackBar = SnackBar(
                //     content: const Text('invalid email or password'),
                //     action: SnackBarAction(
                //       label: 'Check again',
                //       onPressed: () {},
                //     ),
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
