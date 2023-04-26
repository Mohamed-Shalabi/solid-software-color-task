import 'dart:math';

import 'package:flutter/material.dart';

const _maxColorValue = 255;
const _colorExtremeLimit = 190;
const _maxReducedColorValue = 50;

/// Random color getter function.
Color getRandomColor() {
  final random = Random();

  final redValue = random.nextInt(255);
  final greenValue = random.nextInt(255);
  final blueValue = random.nextInt(255);

  return Color.fromARGB(
    _maxColorValue,
    redValue,
    greenValue,
    blueValue,
  );
}

/// Utilities used to get color variations.
extension ColorUtils on Color {
  /// get a well-contrasted color from this object.
  Color contrasted() {
    return Color.fromARGB(
      _maxColorValue,
      _getFarColorValue(red),
      _getFarColorValue(green),
      _getFarColorValue(blue),
    );
  }
}

int _getFarColorValue(int source) {
  if (source <= _colorExtremeLimit) {
    return _maxColorValue - source;
  }

  final random = Random();

  return source - random.nextInt(_maxReducedColorValue);
}
