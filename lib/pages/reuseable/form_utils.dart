import 'package:flutter/material.dart';

class MyStatefulFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final int? maxLines;

  const MyStatefulFormField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  _MyStatefulFormFieldState createState() => _MyStatefulFormFieldState();
}

class _MyStatefulFormFieldState extends State<MyStatefulFormField> {
  final bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black), // Set input text color to black
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.grey, // Default label text color
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
        filled: true,
        fillColor: Colors.white,
        errorText: _hasError ? "Error message" : null,
      ),
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      onChanged: (value) {
        setState(() {
          // Perform any validation logic here and update _hasError
        });
      },
    );
  }
}
