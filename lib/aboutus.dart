import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TextButton(
          onPressed: () {
            // this takes to previous page
            Navigator.pop(context);
            // this closes the application
            SystemNavigator.pop();
          },
          child: Text("Go back"),
        ),
      ),
    );
  }
}


// Food delivery app
// Travel app
// location tracer
// Freelancing app
// Hotel booking app