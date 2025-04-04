import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BirdsScreen(),
  ));
}

class BirdsScreen extends StatelessWidget {
  final List<Map<String, String>> birdsList = [
    {'name': 'Sparrow', 'image': 'assets/images/birds/sparrow.png'},
    {'name': 'Parrot', 'image': 'assets/images/birds/parrot.png'},
    {'name': 'Eagle', 'image': 'assets/images/birds/eagle.png'},
    {'name': 'Peacock', 'image': 'assets/images/birds/peacock.png'},
    {'name': 'Owl', 'image': 'assets/images/birds/owl.png'},
    {'name': 'Penguin', 'image': 'assets/images/birds/penguin.png'},
    {'name': 'Pigeon', 'image': 'assets/images/birds/pigeon.png'},
    {'name': 'Crow', 'image': 'assets/images/birds/crow.png'},
    {'name': 'Swan', 'image': 'assets/images/birds/swan.png'},
    {'name': 'Duck', 'image': 'assets/images/birds/duck.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Birds")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: birdsList.length,
        itemBuilder: (context, index) {
          return _buildBirdCard(context, birdsList[index]);
        },
      ),
    );
  }

  Widget _buildBirdCard(BuildContext context, Map<String, String> birdData) {
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
              builder: (context) => BirdDetailScreen(birdData: birdData),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(birdData['image']!, width: 100, height: 100),
            SizedBox(height: 10),
            Text(
              birdData['name']!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class BirdDetailScreen extends StatelessWidget {
  final Map<String, String> birdData;
  final AudioPlayer _audioPlayer = AudioPlayer();

  BirdDetailScreen({Key? key, required this.birdData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(birdData['name']!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(birdData['image']!, width: 200, height: 200),
            SizedBox(height: 20),
            Text(
              birdData['name']!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _playSound(),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound() async {
    String soundPath = 'assets/sounds/birds/${birdData['name']!.toLowerCase()}.mp3';
    await _audioPlayer.play(AssetSource(soundPath));
  }
}
