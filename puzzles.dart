import 'package:flutter/material.dart';
import '../puzzle_game.dart'; // Import the puzzle game logic

class PuzzlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Puzzle Game")),
      body: PuzzleGame(), // Display the puzzle game
    );
  }
}
