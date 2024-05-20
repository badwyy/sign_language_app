import 'package:flutter/material.dart';

class QuizLevelsPage extends StatelessWidget {
  const QuizLevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          ' Play & Learn',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              LevelBox(
                  level: 'Easy',
                  colors: [
                    Color.fromARGB(255, 248, 169, 142),
                    Color.fromARGB(255, 187, 137, 44)
                  ],
                  imagePath: 'lib/images/easy.png'),
              SizedBox(
                height: 30,
              ),
              LevelBox(
                level: 'Intermediate',
                colors: [Colors.lightBlue, Color.fromARGB(255, 0, 38, 68)],
                imagePath: 'lib/images/intermediate.png',
              ),
              SizedBox(
                height: 30,
              ),
              LevelBox(
                level: 'Hard',
                colors: [Colors.pinkAccent, Colors.red],
                imagePath: 'lib/images/hard.png',
              ),
              SizedBox(
                height: 30,
              ),
              LevelBox(
                level: 'Expert',
                colors: [Colors.deepPurpleAccent, Colors.purple],
                imagePath: 'lib/images/expert.png',
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelBox extends StatelessWidget {
  final String level;
  final List<Color> colors;
  final String imagePath;

  const LevelBox({
    required this.level,
    required this.colors,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon;
    if (level == 'Easy' || level == 'Intermediate') {
      icon = IconButton(
        onPressed: () {
          // Handle start button tap
        },
        icon: Icon(Icons.play_circle_filled, color: Colors.white, size: 50),
      );
    } else {
      icon = IconButton(
        onPressed: () {
          // Handle locked button tap
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Level $level coming soon...'),
            ),
          );
        },
        icon: Icon(Icons.lock, color: Colors.white, size: 50),
      );
    }

    return Container(
      width: 380,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(width: 10),
                  Text(
                    level,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizLevelsPage(),
  ));
}
