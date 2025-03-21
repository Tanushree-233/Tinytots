import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShapesScreen(),
  ));
}

class ShapesScreen extends StatelessWidget {
  final List<String> shapes = [
    'Circle', 'Square', 'Triangle', 'Rectangle', 'Star', 'Oval', 'Pentagon', 'Hexagon', 'Diamond'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shapes")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: shapes.length,
        itemBuilder: (context, index) {
          return _buildShapeCard(context, shapes[index]);
        },
      ),
    );
  }

  Widget _buildShapeCard(BuildContext context, String shape) {
    return Card(
      elevation: 5,
      color: Colors.pink[100], // Changed to pink
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShapeDetailScreen(shape: shape),
            ),
          );
        },
        child: Center(
          child: Text(
            shape,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ShapeDetailScreen extends StatelessWidget {
  final String shape;
  final AudioPlayer _audioPlayer = AudioPlayer();

  ShapeDetailScreen({Key? key, required this.shape}) : super(key: key);

  final Map<String, String> shapeImages = {
    'Circle': 'assets/images/shapes/circle.png',
    'Square': 'assets/images/shapes/square.png',
    'Triangle': 'assets/images/shapes/triangle.png',
    'Rectangle': 'assets/images/shapes/rectangle.png',
    'Star': 'assets/images/shapes/star.png',
    'Oval': 'assets/images/shapes/oval.png',
    'Pentagon': 'assets/images/shapes/pentagon.png',
    'Hexagon': 'assets/images/shapes/hexagon.png',
    'Diamond': 'assets/images/shapes/diamond.png',
  };

  final Map<String, String> shapeSounds = {
    'Circle': 'assets/sounds/shapes/circle.mp3',
    'Square': 'assets/sounds/shapes/square.mp3',
    'Triangle': 'assets/sounds/shapes/triangle.mp3',
    'Rectangle': 'assets/sounds/shapes/rectangle.mp3',
    'Star': 'assets/sounds/shapes/star.mp3',
    'Oval': 'assets/sounds/shapes/oval.mp3',
    'Pentagon': 'assets/sounds/shapes/pentagon.mp3',
    'Hexagon': 'assets/sounds/shapes/hexagon.mp3',
    'Diamond': 'assets/sounds/shapes/diamond.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details for $shape")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              shape,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.pink), // Changed text color to pink
            ),
            SizedBox(height: 20),

            Image.asset(
              shapeImages[shape] ?? 'assets/images/shapes/circle.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _playSound(shape),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Changed button color to pink
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound(String shape) async {
    String? soundPath = shapeSounds[shape];
    if (soundPath != null) {
      await _audioPlayer.play(AssetSource(soundPath));
    }
  }
}
