import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NumbersScreen(),
  ));
}

class NumbersScreen extends StatelessWidget {
  final List<String> numbers = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Numbers")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return _buildNumberCard(context, numbers[index]);
        },
      ),
    );
  }

  Widget _buildNumberCard(BuildContext context, String number) {
    return Card(
      elevation: 5,
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NumberDetailScreen(number: number),
            ),
          );
        },
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class NumberDetailScreen extends StatelessWidget {
  final String number;
  final AudioPlayer _audioPlayer = AudioPlayer();

  NumberDetailScreen({Key? key, required this.number}) : super(key: key);

  final Map<String, String> numberExamples = {
    '1': 'One Apple', '2': 'Two Balls', '3': 'Three Cats', '4': 'Four Dogs',
    '5': 'Five Elephants', '6': 'Six Fishes', '7': 'Seven Hats', '8': 'Eight Kites',
    '9': 'Nine Lions', '10': 'Ten Monkeys'
  };

  final Map<String, String> numberImages = {
    '1': 'assets/images/1.png',
    '2': 'assets/images/2.png',
    '3': 'assets/images/3.png',
    '4': 'assets/images/4.png',
    '5': 'assets/images/5.png',
    '6': 'assets/images/6.png',
    '7': 'assets/images/7.png',
    '8': 'assets/images/8.png',
    '9': 'assets/images/9.png',
    '10': 'assets/images/10.png',
  };

  final Map<String, String> numberSounds = {
    '1': 'assets/sounds/1.mp3',
    '2': 'assets/sounds/2.mp3',
    '3': 'assets/sounds/3.mp3',
    '4': 'assets/sounds/4.mp3',
    '5': 'assets/sounds/5.mp3',
    '6': 'assets/sounds/6.mp3',
    '7': 'assets/sounds/7.mp3',
    '8': 'assets/sounds/8.mp3',
    '9': 'assets/sounds/9.mp3',
    '10': 'assets/sounds/10.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details for $number")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            SizedBox(height: 20),

            Image.asset(
              numberImages[number]!,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),

            Text(
              numberExamples[number]!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _playSound(number),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound(String number) async {
    String? soundPath = numberSounds[number];
    if (soundPath != null) {
      await _audioPlayer.play(AssetSource(soundPath));
    }
  }
}
