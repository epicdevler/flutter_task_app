import 'package:flutter/material.dart';

import '../utils/task.dart';

class CreateTaskScreen extends StatefulWidget {
  final void Function({required Task task}) addTask;
  final void Function({required Task task}) removeTask;

  const CreateTaskScreen({
    super.key,
    required this.addTask,
    required this.removeTask,
  });

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    String taskTitle = "";
    String description = "";
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(
                  text: taskTitle
                ),
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                onChanged: (value) {
                  taskTitle = value;
                },
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colorScheme.primary),
                  ),
                    onPressed: () {
                      var task = Task(taskTitle, description, DateTime.now());
                      widget.addTask(task: task);
                      taskTitle = "";
                      description = "";
                    },
                    child: const Text("Add", style: TextStyle(
                      color: Colors.white
                    ),)),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
    );
  }
}
