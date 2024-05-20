import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  final IconData? icon; // Optional parameter for the icon (IconData type)

  const Box({required this.icon, super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 280,
                height: 30,
                child:TextFormField(
                  style: TextStyle(color: Colors.black),
                obscureText: true,
                decoration:  InputDecoration(
                  
                    prefixIcon: widget.icon != null ? Icon(widget.icon!) : null,
                    prefixIconColor: Colors.black,
                     enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Set the underline color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Set the focused underline color
          ),
                    
                   
                ),
              ),
              );
  }
}