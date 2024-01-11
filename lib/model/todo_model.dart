import 'package:flutter/material.dart';

class Todo {
  Todo({
    required this.icon,
    required this.text,
  });
  bool isChecked = false;
  final Icon icon;
  final String text;
}
