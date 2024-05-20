import 'package:flutter/material.dart';

   ThemeData lightMode = ThemeData(
      // Define your light mode theme colors
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.white,
        
        secondary: Colors.black,
       tertiary: Color.fromARGB(255,83, 86, 255),
       surface: Colors.black,
        background: Colors.blue,
        
        ),
      );

   ThemeData darkMode = ThemeData(
    // Define your dark mode theme colors
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 52, 52, 52),
        secondary: Colors.white,
        // secondary: Color.fromARGB(255, 52, 52, 52),
        tertiary: Color.fromARGB(255,83, 86, 255),
       surface: Color.fromARGB(255, 255, 255, 255),
        background: Colors.black,
        
        ),

    // Other theme properties...
  );

