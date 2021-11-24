import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://wallpaperaccess.com/full/5792762.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.3,
                width: width * 0.9,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Hello",
                    style: GoogleFonts.cormorantInfant(fontSize: 30),
                  ),
                ),
              ),
              Image.asset(
                'assets/image.jpg',
                height: height * 0.3,
                width: width * 0.9,
              ),
            ],
          ),
        ),
        // body: Column(
        //   children: [
        //     Image.network(
        //       "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        //       height: height - 80,
        //       width: width,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
