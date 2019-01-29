void main() {
  throwDemo(throwException: true);
  throwDemo(throwError: true);
  throwDemo(throwString: true);
  print("=====================");
  catchDemo(throwFormatException: true);
  catchDemo(throwSubFormatException: true);
  catchDemo(throwString: true);
  //catchDemo();
}

/*********************************/

void throwDemo({bool throwException, bool throwError, bool throwString}) {
  try {
    if (throwException ?? false) {
      throw new Exception("This is an exception");
    } else if (throwError ?? false) {
      throw new Error();
    } else if (throwString ?? false) {
      throw "I'm throwing an object";
    }
  } catch (throwedObject) {
    if (throwedObject is Exception) {
      print('exception - ' + throwedObject.toString());
    } else if (throwedObject is Error) {
      print('error - ' + throwedObject.toString());
    } else if (throwedObject is String) {
      print('string - ' + throwedObject.toString());
    }
  } finally {
    print('I get executed AFTER catch block');
  }
}

/******************************************/

class _SubFormatException extends FormatException {
  _SubFormatException([var message]) : super(message);

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

void catchDemo(
    {bool throwFormatException = false,
    bool throwSubFormatException = false,
    bool throwString = false}) {
  try {
    if (throwFormatException) {
      throw new FormatException("I'm a format exception");
    } else if (throwSubFormatException) {
      throw new _SubFormatException("I'm a sub-format exception");
    } else if (throwString) {
      throw "I'm a string";
    }else {
      throw 1;
    }
  } on FormatException catch (e,s) {
    print('caught FormatException: ' + e.message);
  } on _SubFormatException catch (e) {
    print('caught _SubFormatException: ' +e.message);
  } on String catch (e) {
    print(e);
  }
}
