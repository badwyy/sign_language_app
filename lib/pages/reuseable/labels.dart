import 'package:flutter/material.dart';

class Labels extends StatefulWidget {
  final String label;
  const Labels({required this.label, super.key});

  @override
  State<Labels> createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding:
                    const EdgeInsets.only(left: 40.0,top:40), // Add a right offset of 20.0
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align content to the left
                  children: [
                    Text(
                      widget.label,
                      
                      
                      style: TextStyle(fontSize: 18,color: Colors.black),
                    ),
                  ],
                ),
              );
  }
}