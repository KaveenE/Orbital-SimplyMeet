



class AllFieldsNotFilledException implements Exception {
  final String message;

  AllFieldsNotFilledException({String this.message = "AllFieldsNotFilledException"});

  @override
  String toString() {
    return message;
  }
}
