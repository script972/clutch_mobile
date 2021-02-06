import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DistanceUiHelper {
  static String displayOutput(double distance) {
    if (distance == -1) return null;
    var valueTill = 0;
    var valueMore = 0;
    if (distance < 1) {
      valueTill = 1;
    } else if (distance > 1 && distance < 3) {
      valueTill = 3;
    } else if (distance > 3 && distance < 5) {
      valueTill = 5;
    } else if (distance > 5 && distance < 8) {
      valueTill = 8;
    } else if (distance > 5 && distance <= 10) {
      valueTill = 10;
    }
    if (distance > 10) {
      valueMore = 10;
    }
    if (distance > 20) {
      valueMore = 20;
    }
    if (distance > 50) {
      valueMore = 50;
    }
    if (distance > 100) {
      valueMore = 100;
    }
    if (distance > 1000) {
      valueMore = 1000;
    }

    if (valueTill > 0 && valueTill <= 10) {
      return translate(Keys.Till) + ' ${valueTill}${translate(Keys.Km)}';
    } else if (valueMore >= 10) {
      return translate(Keys.More) + ' ${valueMore}${translate(Keys.Km)}';
    }
    return '';
  }
}
