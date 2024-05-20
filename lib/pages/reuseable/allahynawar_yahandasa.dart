import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/navbar/intro_quiz.dart';

class Congrat extends StatelessWidget {
  final int val;
  const Congrat({super.key, required this.val});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Container(
              width: 400.0, // Set width as a double for better precision
              height: 500.0, // Set height as a double for better precision
              child: Image.asset(
                'lib/images/teacher.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0), // Add spacing between image and text
            Text(
              "You got ${val} Points!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
            SizedBox(height: 30,)
,            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizLevelsPage(),
                  ),
                );
              },

              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220.0, 50.0),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                disabledForegroundColor: Colors.white.withOpacity(0.38),
                disabledBackgroundColor: Colors.white
                    .withOpacity(0.12), // Set text color to white (optional)
              ),
              // Add a descriptive button label
            ),
          ],
        ));
  }
}
