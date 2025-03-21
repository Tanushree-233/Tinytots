import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AlphabetsScreen(),
  ));
}

class AlphabetsScreen extends StatelessWidget {
  final List<String> alphabets = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alphabets")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: alphabets.length,
        itemBuilder: (context, index) {
          return _buildAlphabetCard(context, alphabets[index]);
        },
      ),
    );
  }

  Widget _buildAlphabetCard(BuildContext context, String letter) {
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
              builder: (context) => AlphabetDetailScreen(letter: letter),
            ),
          );
        },
        child: Center(
          child: Text(
            letter,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AlphabetDetailScreen extends StatelessWidget {
  final String letter;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AlphabetDetailScreen({Key? key, required this.letter}) : super(key: key);

  final Map<String, String> alphabetExamples = {
    'A': 'Apple', 'B': 'Ball', 'C': 'Cat', 'D': 'Dog', 'E': 'Elephant',
    'F': 'Fish', 'G': 'Guitar', 'H': 'Hat', 'I': 'Ice Cream', 'J': 'Jaguar',
    'K': 'Kite', 'L': 'Lion', 'M': 'Monkey', 'N': 'Nest', 'O': 'Orange',
    'P': 'Panda', 'Q': 'Queen', 'R': 'Rabbit', 'S': 'Sun', 'T': 'Tiger',
    'U': 'Umbrella', 'V': 'Violin', 'W': 'Whale', 'X': 'Xylophone',
    'Y': 'Yarn', 'Z': 'Zebra',
  };

  final Map<String, String> alphabetImages = {
    'A': 'assets/images/a.png',
    'B': 'assets/images/examples/b_ball.png',
    'C': 'assets/images/examples/c_cat.png',
    'D': 'assets/images/examples/d_dog.png',
    'E': 'assets/images/examples/e_elephant.png',
    'F': 'assets/images/examples/f_fish.png',
    'G': 'assets/images/examples/g_guitar.png',
    'H': 'assets/images/examples/h_hat.png',
    'I': 'assets/images/examples/i_icecream.png',
    'J': 'assets/images/examples/j_jaguar.png',
    'K': 'assets/images/examples/k_kite.png',
    'L': 'assets/images/examples/l_lion.png',
    'M': 'assets/images/examples/m_monkey.png',
    'N': 'assets/images/examples/n_nest.png',
    'O': 'assets/images/examples/o_orange.png',
    'P': 'assets/images/examples/p_panda.png',
    'Q': 'assets/images/examples/q_queen.png',
    'R': 'assets/images/examples/r_rabbit.png',
    'S': 'assets/images/examples/s_sun.png',
    'T': 'assets/images/examples/t_tiger.png',
    'U': 'assets/images/examples/u_umbrella.png',
    'V': 'assets/images/examples/v_violin.png',
    'W': 'assets/images/examples/w_whale.png',
    'X': 'assets/images/examples/x_xylophone.png',
    'Y': 'assets/images/examples/y_yarn.png',
    'Z': 'assets/images/examples/z_zebra.png',
  };

  final Map<String, String> alphabetSounds = {
    'A': 'assets/sounds/a.mp3',
    'B': 'assets/sounds/b.mp3',
    'C': 'assets/sounds/c.mp3',
    'D': 'assets/sounds/d.mp3',
    'E': 'assets/sounds/e.mp3',
    'F': 'assets/sounds/f.mp3',
    'G': 'assets/sounds/g.mp3',
    'H': 'assets/sounds/h.mp3',
    'I': 'assets/sounds/i.mp3',
    'J': 'assets/sounds/j.mp3',
    'K': 'assets/sounds/k.mp3',
    'L': 'assets/sounds/l.mp3',
    'M': 'assets/sounds/m.mp3',
    'N': 'assets/sounds/n.mp3',
    'O': 'assets/sounds/o.mp3',
    'P': 'assets/sounds/p.mp3',
    'Q': 'assets/sounds/q.mp3',
    'R': 'assets/sounds/r.mp3',
    'S': 'assets/sounds/s.mp3',
    'T': 'assets/sounds/t.mp3',
    'U': 'assets/sounds/u.mp3',
    'V': 'assets/sounds/v.mp3',
    'W': 'assets/sounds/w.mp3',
    'X': 'assets/sounds/x.mp3',
    'Y': 'assets/sounds/y.mp3',
    'Z': 'assets/sounds/z.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details for $letter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              letter,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            SizedBox(height: 20),

            Image.asset(
              'assets/images/a.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),

            Text(
              '${alphabetExamples[letter]} is for $letter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _playSound(letter),
              child: Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playSound(String letter) async {
    String? soundPath = alphabetSounds[letter];
    if (soundPath != null) {
      await _audioPlayer.play(AssetSource(soundPath));
    }
  }
}
