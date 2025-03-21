import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Games")),
      body: Center(child: Text("Play Fun Learning Games!", style: TextStyle(fontSize: 20))),
    );
  }
}
