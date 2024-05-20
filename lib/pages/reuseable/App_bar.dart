import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/navbar/profile.dart';

class App_bar extends StatelessWidget {
  const App_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                    builder: (context) => profile(val: 0.557,name: "Boudy",)),
              );
            },
          ),
        ],
      );
  }
}