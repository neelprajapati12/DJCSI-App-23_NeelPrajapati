import 'dart:convert';

import 'package:csi_app/helper/util.dart';
import 'package:csi_app/insideview/work.dart';
import 'package:csi_app/view/add_screen.dart';
import 'package:csi_app/view/settings.dart';
import 'package:csi_app/view/tasks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  String quote = '';

  Future<void> fetchQuoteContent() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/quotes/random'));

    if (response.statusCode == 200) {
      final List<dynamic> dataList = json.decode(response.body);
      if (dataList.isNotEmpty) {
        final Map<String, dynamic> data = dataList[0];
        setState(() {
          quote = data['content'];
        });
      }
    } else {
      print('Failed to fetch quote');
    }
  }

  @override
  void initState() {
    super.initState();

    fetchQuoteContent();
  }

  // TODO: implement initState

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 210, 134, 13),
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 216, 171, 98)),
                child: Text("Data")),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddScreen()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 210, 134, 13),
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddScreen()));
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        //bottom navigation bar on scaffold
        color: Color.fromARGB(255, 216, 171, 98),
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            4, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.list_alt_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                //boxShadow: ,
                color: Color.fromARGB(255, 210, 134, 13),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(quote,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(context,
                  title: "Work",
                  icon: Icon(
                    Icons.work,
                  ), onpressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Work()));
              }),
              Button(context,
                  title: "Personal",
                  icon: Icon(Icons.person),
                  onpressed: () {}),
              Button(context,
                  title: "Shopping",
                  icon: Icon(Icons.shopping_bag),
                  onpressed: () {}),
              Button(context,
                  title: "Health",
                  icon: Icon(Icons.health_and_safety_outlined),
                  onpressed: () {})
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(child: Tasks()),
        ],
      ),
    );
  }
}
