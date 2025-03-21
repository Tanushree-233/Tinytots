import 'package:flutter/material.dart';
import 'modules/alphabets.dart';
import 'modules/numbers.dart';
import 'modules/shapes.dart';
import 'modules/colors.dart';
import 'modules/animals.dart';
import 'modules/birds.dart';
import 'modules/poems.dart';
import 'modules/exercises.dart';
import 'modules/games.dart';
import 'modules/puzzles.dart';
import 'modules/media.dart';
import 'modules/settings.dart'; // Import settings module

const MaterialColor customPink = MaterialColor(
  0xFFFA20A6,
  <int, Color>{
    50: Color(0xFFFFE6F0),
    100: Color(0xFFFFCCE1),
    200: Color(0xFFFF99C2),
    300: Color(0xFFFF66A3),
    400: Color(0xFFFF3384),
    500: Color(0xFFFA20A6),
    600: Color(0xFFD11C8C),
    700: Color(0xFFAA1773),
    800: Color(0xFF83125A),
    900: Color(0xFF5C0D41),
  },
);

void main() {
  runApp(TinyTotsApp());
}

class TinyTotsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinyTots',
      theme: ThemeData(primarySwatch: customPink),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final String userRole = "Student"; // Change to "Parent" or "Teacher" accordingly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC1E3),
      appBar: AppBar(
        title: Text("TinyTots Learning App"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen(userRole: userRole)),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        children: [
          _buildMenuItem(context, "Alphabets", "assets/images/alphabets.png", AlphabetsScreen()),
          _buildMenuItem(context, "Numbers", "assets/images/numbers.png", NumbersScreen()),
          _buildMenuItem(context, "Shapes", "assets/images/shapes.png", ShapesScreen()),
          _buildMenuItem(context, "Colors", "assets/images/colors.png", ColorsScreen()),
          _buildMenuItem(context, "Animals", "assets/images/animals.png", AnimalsScreen()),
          _buildMenuItem(context, "Birds", "assets/images/birds.png", BirdsScreen()),
          _buildMenuItem(context, "Poems", "assets/images/poems.png", PoemsScreen()),
          _buildMenuItem(context, "Exercises", "assets/images/exercise.png", ExercisesScreen()),
          _buildMenuItem(context, "Games", "assets/images/games.png", GamesScreen()),
          _buildMenuItem(context, "Puzzles", "assets/images/puzzles.png", PuzzlesScreen()),
          _buildMenuItem(context, "Media", "assets/images/media.png", MediaScreen()),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String imagePath, Widget page) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
