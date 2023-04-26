import 'package:flutter/material.dart';
import 'package:solid_software/color_state.dart';
import 'package:solid_software/my_home_page.dart';

/// The application class.
class MyApp extends StatelessWidget {
  /// The default application class constructor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

/// The global state of the background base color.
final state = ColorState();
