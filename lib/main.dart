import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/aboutus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
      routes: {
        '/aboutUs': (_) => const AboutUs(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = const TextStyle(
    color: Colors.orange,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );

  var buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.red),
    backgroundColor: MaterialStateProperty.all(Colors.black),
    elevation: MaterialStateProperty.all(15),
    fixedSize: MaterialStateProperty.all(
      Size.fromWidth(400),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is appbar"),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              elevation: 20,
              color: Colors.black,
              child: myText(text: "Hello1", color: Colors.red),
            ),
            myText(text: "Hell012", color: Colors.green),
            myText(text: "Hello3", color: Colors.blue),
            Card(
              elevation: 7,
              color: Colors.blue,
              shadowColor: Colors.black,
              child: myText(
                text: "Hello3",
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 10,
                child: Image.asset(
                  'assets/image.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 50),
            Image.network(
              'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            MaterialButton(
              onPressed: () {
                // this lets user go back
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AboutUs(),
                //   ),
                // );
                Navigator.pushNamed(context, '/aboutUs');
                // this doesn't let user go back
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AboutUs(),
                //   ),
                //   (route) => false,
                // );
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   '/aboutUs',
                //   (route) => false,
                // );
              },
              child: const Text("Material Button"),
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              elevation: 0,
              height: 100,
              minWidth: 200,
              splashColor: Colors.red,
              hoverElevation: 20,
            ),
            TextButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text("Text Button"),
            ),
            IconButton(
              onPressed: () {
                log("Icon button pressed");
                print("Icon button pressed");
              },
              color: Colors.red,
              icon: Icon(
                Icons.add,
              ),
            ),
            OutlinedButton(
              style: buttonStyle.copyWith(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.green, width: 5),
                ),
              ),
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.red),
              //   side: MaterialStateProperty.all(
              //     BorderSide(color: Colors.black),
              //   ),
              // ),
              onPressed: () {},
              child: Text("Outlined Button"),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Text("Elevated Button"),
            ),
          ],
        ),
      ),
    );
  }

  Text myText({required String text, required Color color}) {
    return Text(
      text,
      style: style.copyWith(color: color),
    );
  }
}
