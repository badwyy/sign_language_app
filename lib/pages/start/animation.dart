// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_lang_flut/pages/start/login_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>? _fadeInAnimation;
  late Animation<double>? _scaleAnimation;
  late Animation<double>? _textAnimation; // Added animation for the text

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 0.8)),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0)), // Delay the text animation by 1 second
    );
    _controller.forward().whenComplete(() {
      // Navigate to the login page when the animation finishes
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
         color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeInAnimation!,
                child: ScaleTransition(
                  scale: _scaleAnimation!,
                  child: Lottie.asset(
                    'lib/assets/hands2.json',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              // 
              //Add spacing between icons and text
              SizedBox( height: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: FadeTransition(
                  opacity: _textAnimation!, // Use the delayed animation for the text
                  child: const Text(
                    'Communication Made \n Easy!',
                    style: TextStyle(
                      
                      color: Color.fromARGB(255,55, 140, 231),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
