import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Work extends StatefulWidget {
  var tasklist;

  Work({Key? key, this.tasklist}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  List tasklists = [];

  getData() {
    if (widget.tasklist != null) {
      final data = widget.tasklist.keys.map((e) {
        final items = widget.tasklist.get(e);
        return {"key": e, "task": items["task"]};
      }).toList();
      setState(() {
        tasklists = data.reversed.toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    //final todo = Hive.box("taskss");
    print(tasklists);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
        appBar: AppBar(
          title: Text("Work Tasks"),
          backgroundColor: Color.fromARGB(255, 210, 134, 13),
        ),
        body: tasklists == null || tasklists.isEmpty
            ? Container(
                child: Text("NO data"),
              )
            : ListView.builder(
                itemCount: tasklists.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 216, 171, 98),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              //  width: MediaQuery.sizeOf(context).width / 2,
                              child: Text(
                            tasklists[index]["task"],
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
