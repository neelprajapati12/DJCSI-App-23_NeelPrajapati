import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  List<Map<String, dynamic>> a = [];
  List<Map<String, dynamic>> users = [];
  final name = TextEditingController();
  final age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfields"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: name,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: age,
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                a.add({
                  "name": name.text,
                  "age": age.text,
                });
                name.clear();
                age.clear();
                setState(() {});
              },
              child: Text("Add")),
          a.isEmpty
              ? Container(
                  child: Text("No data"),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: a.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${index + 1} ${a[index]["name"]} ${a[index]["age"]}"),
                            IconButton(
                                onPressed: () {
                                  a.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete))
                          ],
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
