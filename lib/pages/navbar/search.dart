// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  String imageName = '';

  List<String> imgList = [
    'hello',
    'family',
    'goodbye',
    'house',
    'no',
  ];

  Widget getImageWidget() {
    if (imageName.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          // Center the icon within the container
          child: Icon(
            Icons.photo_size_select_actual_rounded, // Choose your desired icon
            size: 120.0, // Adjust icon size as needed
          ),
        ),
      );
    } else if (imageName.isNotEmpty && imgList.contains(imageName)) {
      return Image.asset(
        'lib/images/$imageName.jpg',
        fit: BoxFit.cover,
      );
    } else {
      // If imageName is empty or not found in imgList, return a default widget
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'lib/assets/error.json', // Path to your Lottie animation file
                height: 250,
                width: 250,
              ),
               // Add space between animation and texts
              Text(
                'Error:', // First line of text
                style: TextStyle(
                  fontSize:40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                'mala2etsh haga ya aboya', // Second line of text
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(15.0), // Adjust margin values as needed
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // Adjust the radius
                    borderSide: BorderSide.none, // Hide the border
                  ),
                  hintText: 'Search for an image', // Add hint text
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0, // Adjust padding values
                  ),
                  prefixIcon: const Icon(Icons.search), // Add search icon
                ),
                // Other TextFormField properties...
                onFieldSubmitted: (value) {
                  setState(() {
                    imageName = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: getImageWidget(),
              ),
            ),
          ],
        ),
      );
    
  }
}
