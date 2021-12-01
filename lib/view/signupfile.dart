import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/view/homepage.dart';
import 'package:myapp/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.username}) : super(key: key);
  final String? username;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordhide = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        // color: Colors.blue,
        width: width,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Login here to continue"),
              // this field can be validated
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email address",
                  fillColor: Colors.yellow,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (!value!.contains("@")) {
                    return "The email is invalid";
                  }
                  if (!value.contains(".com")) {
                    return "The email is invalid";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordhide,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Email password",
                  // fillColor: Colors.yellow,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordhide = !passwordhide;
                      });
                    },
                    icon: passwordhide
                        ? const Icon(
                            Icons.visibility_outlined,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                          ),
                  ),
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.length < 8) {
                    return "Too short password";
                  }

                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    log("Login successful");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  }
                },
                child: Text("Login"),
              ),

              // this field cannot be validated
              // TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
