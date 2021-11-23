import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String? username;

  const LoginPage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as LoginPage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Container(
        width: 400,
        height: 200,
        color: Colors.red,
        child: Center(
          child: Row(
            children: const [
              Text(
                "Hello",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Hello2",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
