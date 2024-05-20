import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/navbar/drawer.dart';
import 'package:sign_lang_flut/pages/navbar/profile.dart';
import 'package:sign_lang_flut/pages/reuseable/allahynawar_yahandasa.dart';



class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State {
  List<Map<String, dynamic>> questions = [
    {
      'image': 'lib/assets/eat.png',
      'correctAnswer': 'eat',
      'options': ['oh no', 'eat', 'hello', 'goodbye'],
    },
    {
      'image': 'lib/assets/hello.png',
      'correctAnswer': 'hello',
      'options': ['hello', 'goodbye', 'no', 'yes'],
    },
    {
      'image': '/libassets/loser.png',
      'correctAnswer': 'loser',
      'options': ['hello', 'goobye', 'loser', 'yes'],
    },
    {
      'image': '/libassets/thank-you.png',
      'correctAnswer': 'thank you',
      'options': ['hello', 'goodbye', 'no', 'thank you'],
    },
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // End of quiz
      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Congrat(val: score)),
                          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(30),
                iconColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_rounded,
            ),
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(30),
              iconColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => profile(val: 0.557,name: "OMAR",)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  questions[currentQuestionIndex]['image'],
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            // SizedBox(height: 10), // Spacing between image and buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(questions[currentQuestionIndex]['options'][0]);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                  child: Text(questions[currentQuestionIndex]['options'][0]),
                ),
                SizedBox(height: 10), // Spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(questions[currentQuestionIndex]['options'][1]);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                  child: Text(questions[currentQuestionIndex]['options'][1]),
                ),
                SizedBox(height: 20), // Spacing between button pairs
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(questions[currentQuestionIndex]['options'][2]);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                  child: Text(questions[currentQuestionIndex]['options'][2]),
                ),
                SizedBox(height: 10), // Spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(questions[currentQuestionIndex]['options'][3]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                  child: Text(questions[currentQuestionIndex]['options'][3]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
