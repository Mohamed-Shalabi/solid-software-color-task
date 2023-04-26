import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_software/color_state.dart';
import 'package:solid_software/color_utils.dart';
import 'package:solid_software/my_app.dart';

/// A widget that builds nested containers recursively for [bordersNumber]
/// times with auto-calculated padding between them (Which looks like a border),
/// then builds [lastChild].
class ColorfulNestedBorder extends StatefulWidget {
  /// The number of borders.
  final int bordersNumber;

  /// The child that the widget rebuilds after finishing the borders.
  final Widget? lastChild;

  /// A boolean used to calculate the paddings of the borders.
  final bool isFirstBorder;

  /// The default constructor.
  const ColorfulNestedBorder({
    Key? key,
    required this.bordersNumber,
    required this.isFirstBorder,
    this.lastChild,
  }) : super(key: key);

  @override
  State<ColorfulNestedBorder> createState() => _ColorfulNestedContainerState();
}

class _ColorfulNestedContainerState extends State<ColorfulNestedBorder> {
  static const animationDuration = Duration(milliseconds: 600);
  static const minPadding = 2.0;

  EdgeInsetsGeometry get padding {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final screenMinDimension = min(screenWidth, screenHeight);
    final halfScreenMinDimension = screenMinDimension / 2;

    var paddingValue = halfScreenMinDimension / bordersNumber;

    if (paddingValue < minPadding) {
      paddingValue = minPadding;
    }

    return EdgeInsets.all(paddingValue);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bordersNumber == 0) {
      return widget.lastChild ?? const SizedBox();
    }

    var finalBordersNumber = widget.bordersNumber;
    final screenWidth = MediaQuery.of(context).size.width;
    if (widget.bordersNumber * minPadding > screenWidth) {
      finalBordersNumber = screenWidth ~/ minPadding;
    }

    return AnimatedContainer(
      duration: animationDuration,
      alignment: Alignment.center,
      padding: padding,
      decoration: BoxDecoration(
        color: _getColor(),
        borderRadius: BorderRadius.circular(padding.horizontal),
      ),
      child: ColorfulNestedBorder(
        bordersNumber: finalBordersNumber - 1,
        lastChild: widget.lastChild,
        isFirstBorder: false,
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

  Color _getColor() {
    var color = state.value.contrasted();
    if (widget.bordersNumber.isEven) {
      color = color.contrasted();
    }

    return color;
  }
}
