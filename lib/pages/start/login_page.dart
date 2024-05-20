import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/reuseable/labels.dart';
import 'package:sign_lang_flut/pages/navbar/nav_bar.dart';
import 'package:sign_lang_flut/pages/start/register_page.dart';

import 'package:sign_lang_flut/pages/reuseable/sizedbox.dart';

// Modify LoginPage to be stateful
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: 
        Container(
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
                "LOGIN",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const Labels(label: 'Username'),

              const Box(icon: Icons.person),
              const Labels(label: "Password"),
              const Box(icon: Icons.lock),

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
                  Navigator.push(
                    context, // BuildContext of the current widget
                    MaterialPageRoute(
                        builder: (context) =>
                            const NavBar()), // Route definition
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text('login successful!',style: TextStyle(color:Theme.of(context).colorScheme.primary),),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
              // Add a Row for the register text and button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Don\'t have an account?',style: TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child:  Text(
                      'Register',
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
