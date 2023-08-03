import 'package:assignment_2/screens/task.dart';
import 'package:assignment_2/screens/add_task_page.dart';
import 'package:assignment_2/widgets/my_appbar.dart';
import 'package:assignment_2/widgets/taskcard.dart';
import 'package:flutter/material.dart';

class TaskBoardPage extends StatefulWidget {
  const TaskBoardPage({super.key});

  @override
  State<TaskBoardPage> createState() => _TaskBoardPageState();
}

class _TaskBoardPageState extends State<TaskBoardPage> {
  List<TaskCardData> tasks = [
    TaskCardData(
      title: "Task One",
      description:
          "Your Personal task management and planning solution for planning your day, week & months",
      deadline: DateTime(2023, 5, 23, 12, 55),
    ),
    TaskCardData(
      title: "Task Two",
      description:
          "Your Personal task management and planning solution for planning your day, week & months",
      deadline: DateTime(2023, 5, 21, 12, 55),
    ),
    TaskCardData(
      title: "Task Three",
      description:
          "Your Personal task management and planning solution for planning your day, week & months",
      deadline: DateTime(2023, 5, 11, 11, 55),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(titleText: "Task Board"),
      body: ListView(
        children: List.from(tasks.map((task) {
          return TaskCardWidget(taskCardData: task);
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => AddTaskPage(
                onTaskAddCallback: (task) {
                  setState(() {
                    tasks.add(task);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
