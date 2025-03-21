import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimalsScreen(),
  ));
}

class AnimalsScreen extends StatelessWidget {
  final List<Map<String, String>> animalsList = [
    {'name': 'Lion', 'image': 'assets/images/animals/lion.png'},
    {'name': 'Elephant', 'image': 'assets/images/animals/elephant.png'},
    {'name': 'Dog', 'image': 'assets/images/animals/dog.png'},
    {'name': 'Cat', 'image': 'assets/images/animals/cat.png'},
    {'name': 'Tiger', 'image': 'assets/images/animals/tiger.png'},
    {'name': 'Monkey', 'image': 'assets/images/animals/monkey.png'},
    {'name': 'Zebra', 'image': 'assets/images/animals/zebra.png'},
    {'name': 'Bear', 'image': 'assets/images/animals/bear.png'},
    {'name': 'Giraffe', 'image': 'assets/images/animals/giraffe.png'},
    {'name': 'Rabbit', 'image': 'assets/images/animals/rabbit.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animals")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: animalsList.length,
        itemBuilder: (context, index) {
          return _buildAnimalCard(context, animalsList[index]);
        },
      ),
    );
  }

  Widget _buildAnimalCard(BuildContext context, Map<String, String> animalData) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimalDetailScreen(animalData: animalData),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(animalData['image']!, width: 100, height: 100),
            SizedBox(height: 10),
            Text(
              animalData['name']!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimalDetailScreen extends StatelessWidget {
  final Map<String, String> animalData;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AnimalDetailScreen({Key? key, required this.animalData}) : super(key: key);

  final Map<String, String> animalSounds = {
    'Lion': 'assets/sounds/animals/lion.mp3',
    'Elephant': 'assets/sounds/animals/elephant.mp3',
    'Dog': 'assets/sounds/animals/dog.mp3',
    'Cat': 'assets/sounds/animals/cat.mp3',
    'Tiger': 'assets/sounds/animals/tiger.mp3',
    'Monkey': 'assets/sounds/animals/monkey.mp3',
    'Zebra': 'assets/sounds/animals/zebra.mp3',
    'Bear': 'assets/sounds/animals/bear.mp3',
    'Giraffe': 'assets/sounds/animals/giraffe.mp3',
    'Rabbit': 'assets/sounds/animals/rabbit.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details for ${animalData['name']}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(animalData['image']!, width: 200, height: 200),
            SizedBox(height: 20),

            Text(
              animalData['name']!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _playSound(animalData['name']!),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound(String animalName) async {
    String? soundPath = animalSounds[animalName];
    if (soundPath != null) {
      await _audioPlayer.play(AssetSource(soundPath));
    }
  }
}
