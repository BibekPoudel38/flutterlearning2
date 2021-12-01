import 'package:flutter/material.dart';
import 'package:myapp/view/homepage.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int selected = 0;

  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
      ),
      bottomNavigationBar: bottomBar(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: (val) {
          setState(() {
            selected = val;
            controller.jumpToPage(val);
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      currentIndex: selected,
      onTap: (val) {
        setState(() {
          selected = val;

          controller.animateToPage(
            val,
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceIn,
          );
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
