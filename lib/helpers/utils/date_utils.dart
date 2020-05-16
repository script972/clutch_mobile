import 'package:intl/intl.dart';

class DateUtils {
  static const Map<int, String> weekdays = {
    1: "Понедельник",
    2: "Вторник",
    3: "Среда",
    4: "Четверг",
    5: "Пятница",
    6: "Суббота",
    7: "Воскресенье",
  };

  static String timestampToString(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat.yMMMd().format(date); // Apr 8, 2020
  }
}
