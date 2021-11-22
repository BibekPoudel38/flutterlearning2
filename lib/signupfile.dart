import 'dart:developer';

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key, this.username}) : super(key: key);
  final String? username;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username!),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Enter email",
                fillColor: Colors.blue,
                filled: true,
              ),
              validator: (value) {
                if (!value!.contains('@')) {
                  return "Invalid email";
                }
                if (value.length > 90) {
                  return "Too long password";
                }
                return null;
              },
            ),
            TextField(),
            TextButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
                // if (formKey.currentState!.validate()) {
                //   // send data to the server
                // } else {
                //   // do nothing
                // }
              },
              child: Text("Print"),
            ),
            show
                ? Text(
                    "Hello there I am true",
                    style: TextStyle(fontSize: 35),
                  )
                : Text(
                    "HEllo there i am false",
                    style: TextStyle(fontSize: 35),
                  ),
            Visibility(
              visible: show,
              child: Text("Visible"),
            ),
          ],
        ),
      ),
    );
  }
}
