
class AllFieldsNotFilledException implements Exception {
  final String message;

  AllFieldsNotFilledException({ this.message = "AllFieldsNotFilledException"});

  @override
  String toString() {
    return message;
  }
}
