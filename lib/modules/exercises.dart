import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercises")),
      body: Center(child: Text("Practice Exercises Here!", style: TextStyle(fontSize: 20))),
    );
  }
}
