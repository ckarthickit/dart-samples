void main() {
  genericsInLiterals();
  print('================');
  genericMethodDemo();
  print('================');
}

void genericsInLiterals() {
  var names = <String>[
    "Bunny",
    "Scooby",
    "R2-D2"
  ];
  print('names: $names is List<String>? ${names is List<String>}');
}

void genericMethodDemo() {
  String aString = emitTheValue("input");
  print('aString: $aString, runtimeType= ${aString.runtimeType}');
  int aNumber = emitTheValue(1);
  print('aNumber: $aNumber, runtimeType= ${aNumber.runtimeType}');
  //un-commenting the below code will result in error
  //num b = emitTheValue("2.0");
}

T emitTheValue<T extends Object>(T input) {
  return input;
}