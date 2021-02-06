class EnumInvertor<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumInvertor(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
