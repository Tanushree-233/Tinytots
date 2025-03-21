import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Videos & Sounds")),
      body: Center(child: Text("Watch Educational Videos!", style: TextStyle(fontSize: 20))),
    );
  }
}
