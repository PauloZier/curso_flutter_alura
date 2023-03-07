import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;

  const Editor(
      {required this.controller,
      required this.labelText,
      required this.hintText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}