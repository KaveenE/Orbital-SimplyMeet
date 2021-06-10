

class PasswordNotSameException implements Exception {
  final String message;

  PasswordNotSameException({String this.message = "PasswordNotSameException"});

  @override
  String toString() {
    return message;
  }
}

class AllFieldsNotFilledException implements Exception {
  final String message;

  AllFieldsNotFilledException({String this.message = "AllFieldsNotFilledException"});

  @override
  String toString() {
    return message;
  }
}
