import 'package:flutter/material.dart';
import 'package:solid_software/my_app.dart';

void main() {
  runApp(
    ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 200,
      ),
      child: const MyApp(),
    ),
  );
}
