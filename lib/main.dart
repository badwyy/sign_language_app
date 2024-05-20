import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/darkmode/theme_provider.dart';
import 'package:sign_lang_flut/pages/start/animation.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>Theme_provider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
        theme: Provider.of<Theme_provider>(context).themeData,
      );
    
  }
}
