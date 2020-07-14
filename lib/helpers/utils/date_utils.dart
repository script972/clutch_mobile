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
    if (timestamp == null) return null;
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
    return DateFormat.yMMMd().format(date); // Apr 8, 2020
  }

  static String dayMonthInString(DateTime dateTime) {
    Intl.defaultLocale = "ru_RU";
    //initializeDateFormatting(Platform.localeName.split('_')[0], null);
    return DateFormat.MMMd().format(dateTime);
  }
}
