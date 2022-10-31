import 'package:flutter/material.dart';
import 'package:task_app/utils/routes.dart';

import 'components/aligner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              Text("Tasks", style: typography.titleMedium,),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index){
                    return Text("");
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
}
