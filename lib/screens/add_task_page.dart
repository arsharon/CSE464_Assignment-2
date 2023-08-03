import 'package:assignment_2/screens/task.dart';
import 'package:assignment_2/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  final void Function(TaskCardData) onTaskAddCallback;

  const AddTaskPage({super.key, required this.onTaskAddCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: "Add Task"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Enter Task Name",
                  label: Text("Task Name"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Enter Task Description",
                  label: Text("Task Description"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                maxLines: 5,
              ),
              const Spacer(),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                  padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
