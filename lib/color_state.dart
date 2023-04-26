import 'package:flutter/material.dart';

/// State management observable class for color.
/// This class lets clients change and listen to color changes.
/// When the setter [value] is called, all [_colorNotifier] listeners
/// are executed.
class ColorState {
  final ValueNotifier<Color> _colorNotifier;

  /// Getter for the current value of the color.
  Color get value => _colorNotifier.value;

  /// Setter for the value of the color.
  /// When this setter is called, all the listeners in [_colorNotifier]
  /// are executed.
  set value(Color color) {
    _colorNotifier.value = color;
  }

  /// The default constructor for [ColorState].
  /// It initializes the [_colorNotifier] property with [Colors.white]
  /// as the default value.
  ColorState() : _colorNotifier = ValueNotifier(Colors.white);

  /// - Adds the listener [listen] to the state listeners.
  /// - This [listen] is executed on [value] changes.
  /// - You should listen to it in [State.initState] callback.
  void addListener(VoidCallback listen) {
    _colorNotifier.addListener(listen);
  }

  /// Removes the listener [listen] from the state listeners.
  /// You should call it in [State.dispose] callback to avoid
  /// debugging problems.
  void removeListener(VoidCallback listen) {
    _colorNotifier.removeListener(listen);
  }
}

const _bordersNumber = 10;

/// The number of borders.
const bordersNumber =
    _bordersNumber < _minBordersNumber ? _minBordersNumber : _bordersNumber;

/// Them minimum available borders number.
const _minBordersNumber = 5;
