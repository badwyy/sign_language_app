import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/reuseable/labels.dart';
import 'package:sign_lang_flut/pages/start/login_page.dart';
import 'package:sign_lang_flut/pages/reuseable/sizedbox.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  // ... Implement your registration form here
  String username = "";
  String password = "";

  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body:Container(
          margin: const EdgeInsets.only(
              top: 160.0, bottom: 160, left: 20, right: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 243, 255),
            borderRadius: BorderRadius.circular(15),           
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "REGISTER",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              const Labels(label: 'Username'),

              const Box(icon: Icons.person),
              const Labels(label: "Password"),
              const Box(icon: Icons.lock),

              const Labels(label: "Confirm Password"),
              const Box(icon: Icons.lock_person_outlined),

              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize:
                      MaterialStateProperty.all(const Size(280.0, 40.0)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text('Registerd successfully!',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    ),
                  );
                },
                child: const Text('Register'),
              ),
              // Add a Row for the register text and button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?',style: TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}
