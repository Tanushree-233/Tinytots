import 'package:flutter/material.dart';

class PuzzlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Puzzles")),
      body: Center(child: Text("Solve Educational Puzzles!", style: TextStyle(fontSize: 20))),
    );
  }
}
