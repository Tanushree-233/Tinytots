import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ColorsScreen(),
  ));
}

class ColorsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> colorsList = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Orange', 'color': Colors.orange},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Pink', 'color': Colors.pink},
    {'name': 'Brown', 'color': Colors.brown},
    {'name': 'Black', 'color': Colors.black},
    {'name': 'White', 'color': Colors.white},
    {'name': 'Gray', 'color': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Colors")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return _buildColorCard(context, colorsList[index]);
        },
      ),
    );
  }

  Widget _buildColorCard(BuildContext context, Map<String, dynamic> colorData) {
    return Card(
      elevation: 5,
      color: colorData['color'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ColorDetailScreen(colorData: colorData),
            ),
          );
        },
        child: Center(
          child: Text(
            colorData['name'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ColorDetailScreen extends StatelessWidget {
  final Map<String, dynamic> colorData;
  final AudioPlayer _audioPlayer = AudioPlayer();

  ColorDetailScreen({Key? key, required this.colorData}) : super(key: key);

  final Map<String, String> colorSounds = {
    'Red': 'assets/sounds/colors/red.mp3',
    'Blue': 'assets/sounds/colors/blue.mp3',
    'Yellow': 'assets/sounds/colors/yellow.mp3',
    'Green': 'assets/sounds/colors/green.mp3',
    'Orange': 'assets/sounds/colors/orange.mp3',
    'Purple': 'assets/sounds/colors/purple.mp3',
    'Pink': 'assets/sounds/colors/pink.mp3',
    'Brown': 'assets/sounds/colors/brown.mp3',
    'Black': 'assets/sounds/colors/black.mp3',
    'White': 'assets/sounds/colors/white.mp3',
    'Gray': 'assets/sounds/colors/gray.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details for ${colorData['name']}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              colorData['name'],
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: colorData['color']),
            ),
            SizedBox(height: 20),

            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: colorData['color'],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _playSound(colorData['name']),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound(String colorName) async {
    String? soundPath = colorSounds[colorName];
    if (soundPath != null) {
      await _audioPlayer.play(AssetSource(soundPath));
    }
  }
}
