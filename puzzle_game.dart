import 'package:flutter/material.dart';
import 'dart:math';

class PuzzleGame extends StatefulWidget {
  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  List<Image> puzzlePieces = [];
  List<int> shuffledIndices = [];
  int gridSize = 3; // 3x3 puzzle

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    puzzlePieces.clear();
    shuffledIndices = List.generate(gridSize * gridSize, (index) => index);
    shuffledIndices.shuffle(Random());

    for (int i = 0; i < gridSize * gridSize; i++) {
      puzzlePieces.add(Image.asset('assets/puzzle/piece_$i.png'));
    }
  }

  void _onPuzzlePieceDropped(int oldIndex, int newIndex) {
    setState(() {
      int temp = shuffledIndices[oldIndex];
      shuffledIndices[oldIndex] = shuffledIndices[newIndex];
      shuffledIndices[newIndex] = temp;
    });
    _checkWinCondition();
  }

  void _checkWinCondition() {
    if (List.generate(gridSize * gridSize, (index) => index).toString() ==
        shuffledIndices.toString()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You solved the puzzle!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _generatePuzzle();
                });
              },
              child: Text("Play Again"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridSize),
      itemCount: puzzlePieces.length,
      itemBuilder: (context, index) {
        return Draggable<int>(
          data: index,
          child: DragTarget<int>(
            onAccept: (oldIndex) => _onPuzzlePieceDropped(oldIndex, index),
            builder: (context, candidateData, rejectedData) {
              return Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: puzzlePieces[shuffledIndices[index]],
              );
            },
          ),
          feedback: Opacity(opacity: 0.7, child: puzzlePieces[shuffledIndices[index]]),
          childWhenDragging: Container(),
        );
      },
    );
  }
}
