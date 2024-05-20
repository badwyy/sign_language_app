import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_lang_flut/pages/navbar/nav_bar.dart';

class UnderConstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Under Construction'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavBar(initialPageIndex: 2)),
              );
            },
          )),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your Lottie animation widget
            Lottie.asset(
              'lib/assets/under_construction.json', // Replace with your Lottie animation file path
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBar(initialPageIndex: 4),
                    ));
                // Navigate to change user name page
              },
              child: const Text('Give Feedback'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 39, 125, 196),
                  foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
