import 'package:flutter/material.dart';

class ColorHelper {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor?.replaceAll('#', '') ?? 'F6F6F6';
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
