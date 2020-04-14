import 'package:flutter/material.dart';

class ColorHelper {
  //Пример как делать не надо. Никогда!!!!
  static Color stringToColor(String colorString) {
    String valueString =
        colorString.split('0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    return Color(value);
  }
}
