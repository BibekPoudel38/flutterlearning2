import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String? username;

  const LoginPage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as LoginPage;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.toString()),
      ),
    );
  }
}
