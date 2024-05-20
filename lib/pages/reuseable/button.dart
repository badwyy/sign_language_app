// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/navbar/camera.dart';

class Button extends StatelessWidget {
  final String name;
  final String img ;
  final List<Color> colors;
  Button({super.key, required this.colors,required this.img,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 160,
    height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
        colors: colors, // Assuming you have a defined list of colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: 20),
        Image.asset(
          img, // Assuming you have an image asset path stored in 'img'
          width: 80,
          height: 80,
        ),
        SizedBox(height: 20,),
        Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
      ],
    ),
);

  }
}
