import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        // Center the content within the container
        child: Column(
          // Stack elements vertically (one below the other)
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content within Column
          children: [
            Image.asset(
              'lib/images/sign-language.png', // Replace with your image path
              width: 200, // Adjust image width as needed
              height: 200, // Adjust image height as needed
            ),
            const SizedBox(height: 20), // Add spacing between image and text
             Text(
              'Welcome!', // Replace with your desired text
              style: TextStyle(
                fontSize: 50, // Adjust text size as needed
                fontWeight: FontWeight.bold, // Adjust text weight as needed
                color: Theme.of(context).colorScheme.secondary, // Set text color
              ),
            ),
             Text(
              'let\'s start the journey', // Replace with your desired text
              style: TextStyle(
                fontSize: 20, // Adjust text size as needed
                fontWeight: FontWeight.bold, // Adjust text weight as needed
                color: Theme.of(context).colorScheme.secondary, // Set text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
