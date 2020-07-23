class DateFormattingHelper {
  static T enumFromString<T>(String key, List<T> values) =>
      values.firstWhere((v) => key == _enumToString(v), orElse: () => null);

  static String _enumToString(Object o) => o.toString().split('.').last;
}