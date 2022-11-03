import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_app/utils/routes.dart';

import '../utils/task.dart';
import 'components/aligner.dart';

class HomeScreen extends StatefulWidget {
  final List<Task> taskList = [];
  final List<Task> Function() getTasks;
  final void Function({required Task task}) removeTask;
  final void Function({required int taskPosition}) toggleCompleteStatus;

  HomeScreen({
    super.key,
    required this.getTasks,
    required this.removeTask,
    required this.toggleCompleteStatus,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var typography = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Aligner(
            direction: Axis.vertical,
            children: <Widget>[
              Aligner(
                direction: Axis.vertical,
                children: <Widget>[
                  Text(
                    "Hello,",
                    style: typography.titleMedium,
                  ),
                  Text(
                    "Nwadike,",
                    style: typography.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              Text(
                "Tasks",
                style: typography.titleMedium,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.taskList.length,
                  itemBuilder: (context, index) {
                    var task = widget.taskList[index];
                    return GestureDetector(
                      onLongPress: () {
                        widget.removeTask(task: task);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Task: ${task.title}")],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, createTask);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    observeChange();
  }

  void observeChange() {
    widget.taskList.clear();
    widget.taskList.addAll(widget.getTasks());
  }
}
