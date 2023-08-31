import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget Button(BuildContext context,
        {required String? title,
        required Widget? icon,
        required Function() onpressed}) =>
    Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 171, 98),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: icon!,
            onPressed: onpressed,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(title!),
        ),
      ],
    );

class ModalHelper {
  //Widget? radiobutton;
  String? title;
  String? time;

  ModalHelper({
    required this.title,
    required this.time,
    // required this.radiobutton,
  });
}

class Provider {
  static final todo = Hive.box("taskss");

  static createtasklist(Map<String, dynamic> tasklist) async {
    await todo.add(tasklist);
    print("task ${todo.length}");
  }
}
