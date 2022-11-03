import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_app/screens/create_screen.dart';
import 'package:task_app/screens/home_screen.dart';
import 'package:task_app/utils/routes.dart';
import 'package:task_app/utils/task.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatefulWidget {
  List<Task> taskList = [];

  TaskApp({super.key});

  @override
  State<StatefulWidget> createState() => _TaskApp();
}

class _TaskApp extends State<TaskApp> {
  @override
  Widget build(BuildContext context) {
    void addTask({required Task task}) {
      setState(() {
        widget.taskList.add(task);
      });
    }

    void removeTask({required Task task}) {
      setState(() {
        widget.taskList.remove(task);
      });
    }

    List<Task> getTasks() => widget.taskList;

    void toggleCompleteStatus({required int taskPosition}) {
      widget.taskList[taskPosition].isCompleted =
          !widget.taskList[taskPosition].isCompleted;
    }

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ),
        useMaterial3: true,
      ),
      initialRoute: home,
      routes: {
        home: (BuildContext routeContext) => HomeScreen(
              getTasks: getTasks,
              removeTask: removeTask,
              toggleCompleteStatus: toggleCompleteStatus,
            ),
        createTask: (context) =>
            CreateTaskScreen(addTask: addTask, removeTask: removeTask),
      },
    );
  }
}
