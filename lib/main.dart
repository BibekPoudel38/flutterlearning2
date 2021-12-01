import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/view/aboutus.dart';
import 'package:myapp/view/comments.dart';
import 'package:myapp/view/maps.dart';
import 'package:myapp/view/pageviewpage.dart';
import 'package:myapp/view/posts.dart';
import 'package:myapp/view/signupfile.dart';
import 'package:myapp/view/tabviewpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 11),
        ),
      ),
      // theme: ThemeData.dark(),
      home: const CommentView(),
      routes: {
        '/aboutUs': (_) => const AboutUs(),
        // '/login': (_) => const LoginPage(),
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("This is appbar"),
      ),
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
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
            const SizedBox(height: 50),
            Image.network(
              'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            MaterialButton(
              onPressed: () {
                // this lets user go back
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
                Navigator.pushNamed(context, '/aboutUs');
                // this doesn't let user go back
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                  (route) => false,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/aboutUs',
                  (route) => false,
                );
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
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text("Go to login"),
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
                  const BorderSide(color: Colors.green, width: 5),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text("Go to signup page"),
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
