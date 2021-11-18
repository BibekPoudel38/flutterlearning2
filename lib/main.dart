import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
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
            Image.asset(
              'assets/image.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            Image.network(
              'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
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
