import 'package:csi_app/helper/util.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<ModalHelper> taskstodo = [
    ModalHelper(title: "Do homework", time: "20:00"),
    ModalHelper(title: "Go to work", time: "10:00"),
    ModalHelper(title: "Playtime", time: "17:00"),
    ModalHelper(title: "Eat Lunch", time: "13:00"),
    ModalHelper(title: "Flutter", time: "12:00"),
  ];

  String? selectedTask;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "You have 4 tasks for today",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taskstodo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 216, 171, 98),
                          borderRadius: BorderRadius.circular(15)),
                      child: RadioListTile(
                        title: Text(taskstodo[index].title!),
                        value: taskstodo[index].title,
                        groupValue: selectedTask,
                        onChanged: (value) {
                          setState(() {
                            selectedTask = value;
                          });
                        },
                        activeColor: Colors.black,
                        secondary: Text(taskstodo[index].time!),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
