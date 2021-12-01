import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/view/maps.dart';

class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  String getString() {
    return "Name";
  }

  Future<String> loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    return "Hello";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Icon(Icons.home),
              Icon(Icons.settings),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.yellow,
              child: RefreshIndicator(
                onRefresh: () {
                  return loadData();
                },
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(index.toString()),
                    );
                  },
                ),
              ),
            ),
            MapSample(),
          ],
        ),
      ),
    );
  }
}
