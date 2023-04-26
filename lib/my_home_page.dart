import 'package:flutter/material.dart';
import 'package:solid_software/color_state.dart';
import 'package:solid_software/color_utils.dart';
import 'package:solid_software/colorful_nested_border.dart';
import 'package:solid_software/my_app.dart';

/// The home page class.
/// This class represents a stateful widget that shows a number of
/// beautiful nested containers that appear like borders.
class MyHomePage extends StatefulWidget {
  /// The default home page constructor.
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const textPadding = 8.0;
  static const textBackgroundRadius = 16.0;

  Color get color => state.value;
  set color(Color value) {
    state.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          final color = getRandomColor();
          this.color = color;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const ColorfulNestedBorder(
              bordersNumber: bordersNumber,
              isFirstBorder: true,
            ),
            Container(
              padding: const EdgeInsets.all(textPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(textBackgroundRadius),
              ),
              child: Text(
                'Hello There!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    state.removeListener(listener);
    super.dispose();
  }

  @override
  void initState() {
    state.addListener(listener);

    super.initState();
  }

  void listener() {
    setState(() {
      return;
    });
  }
}
