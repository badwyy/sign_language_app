import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_lang_flut/pages/navbar/drawer.dart';
import 'package:sign_lang_flut/pages/navbar/profile.dart';

class Achivements extends StatelessWidget {
  const Achivements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 238, 238, 238),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(30),
                iconColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.background),
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
            icon: const Icon(
              Icons.person_rounded,
            ),
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(30),
              iconColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.background),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => profile(
                          val: 0.557,
                          name: "Boudy",
                        )),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 395,
                height: 420,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(60.0), // Adjust radius as needed
                    bottomRight: Radius.circular(60.0),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'lib/images/boy.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 340.0, // Adjust width as needed
                    height: 280.0, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Column(
                      children: [
                        Text(
                          'Your Progress',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircularPercentIndicator(
                          progressColor: Colors.blue,
                          radius: 60.0,
                          lineWidth: 15.0,
                          percent: 0.5,
                          center: Text(
                            '${0.5 * 100}%',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Level 3",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                    // Optional: Add border or other decorations as desired
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Achivements',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'lib/images/1.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Image.asset(
                            'lib/images/flame.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Image.asset(
                            'lib/images/letter-a.png',
                            width: 80,
                            height: 80,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}