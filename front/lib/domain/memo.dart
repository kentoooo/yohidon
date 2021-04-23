class Memo {
  final String value;

  String toDisplay() => value.length > 29 ? value.substring(0, 29) + "..." : value;

  Memo(this.value);
}
