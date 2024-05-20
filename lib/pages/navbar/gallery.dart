import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with SingleTickerProviderStateMixin {
  List<String> imgList = [
    'lib/images/hello.jpg',
    'lib/images/family.jpg',
    'lib/images/goodbye.jpg',
    'lib/images/house.jpg',
    'lib/images/no.jpg',
  ];
// Initially display Slider 1
  bool _animationShown = false; // Track if animation and text have been shown



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (!_animationShown) {
      // Show animation and text only once when the page is opened
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _animationShown = true;
        });
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
           ListView(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              children: [
                // Text: Most Common Sign Used
                Center(
                  child: Text(
                    'Most Common Sign Used',
                    style: TextStyle(
                      fontSize: screenHeight *
                          0.036, // 24 for a standard screen height
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),

                AspectRatio(
                  aspectRatio: screenWidth /
                      (screenHeight * 0.667), // 3 / 2 aspect ratio
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight *
                          0.444, // 400 for a standard screen height
                      initialPage: 0,
                      autoPlay: true,
                      onPageChanged: (index, _) {
                        // setState(() {
                        //   _currentIndex = index;
                        // });
                      },
                      autoPlayInterval: const Duration(seconds: 8),
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                    items: imgList.map((imageUrl) {
                      return SizedBox(
                        width: double.infinity,
                        child: Image.asset(imageUrl, fit: BoxFit.fill),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          
        ],
      ),
    );
  }
}
