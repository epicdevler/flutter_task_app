import 'package:flutter/material.dart';
import 'package:task_app/screens/create_screen.dart';
import 'package:task_app/screens/home_screen.dart';
import 'package:task_app/utils/routes.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
        ),
        useMaterial3: true,
      ),
      initialRoute: home,
      routes: {
        home: (BuildContext routeContext) => const HomeScreen(),
        createTask: (context) => const CreateTaskScreen(),
      },
    );
  }
}
