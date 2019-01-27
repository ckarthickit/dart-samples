void main() {
  numberDemo();
  print("=============");
  stringsDemo();
  print("=============");
  booleanDemo();
  print("=============");
  listsDemo();
  print("=============");
  mapsDemo();
  print("=============");
  runesDemo();
  print("=============");
  symbolsDemo();
  print("=============");
}

void numberDemo() {
  //num class
  num integerOrFloat = 1;
  integerOrFloat = 2.0;

  //int class
  int number = 1; //64-bit 2's complement integers
  int anotherNum = int.fromEnvironment("defaultPort", defaultValue: 20);
  int hexNumber = 0xabcDeF;
  print('num is ${number} runtimeType: ${number.runtimeType}');
  print('anotherNum is ${anotherNum} runtimeType: ${anotherNum.runtimeType}');

  //double class
  double doubleNum = 2.0;
  var anotherDoubleNum = 2.3e10;
  print('anotherDoubleNum is ${anotherDoubleNum} runtimeType: ${anotherDoubleNum.runtimeType}');

  //int and double methods
  var stringToInt = int.parse('112');
  var stringToDouble = double.parse('3.14');

  //num constants
  //Literal numbers are compile-time constants.
  //Many arithmetic expressions are also compile-time constants, as long as their operands are compile-time constants that evaluate to numbers.
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;  //compile-time constant
}

void stringsDemo() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  
  var s = 'String Interpolation';
  var s5 = 'Dart has ${s} which is very handy';
  var s6 = "Dart has String Interpolation which is very handy";
  if(s5 == s6) {
    print("s5 == s6 is true");
  }
  print('s5 = ${s5}, runtimeType=${s5.runtimeType}');


  //string concatenation
  var stringConcat = "first" + " and " + "second";
  print("demo of stringConcat: " + stringConcat);

  //multi-line strings
  var multiLinestring = '''
  This is a demo of Multi-Line String.
  We can either use tripe " (or) triple '.
  ''';
  print("multiLineString: \n" + multiLinestring);

  //Raw String
  var rawString = r"I'm a raw string. Not even \n gets special treatment :D";
  print("rawString:\n" + rawString);
}

void booleanDemo() {
  bool truthValue = false;
  var fullName = '';
  truthValue = fullName.isEmpty;
  print('fullName isEmpty ?: ${truthValue}');
}

void listsDemo() {
  var list = [1,2,3]; //inferred as List<int>
  print('list = ${list}, runtimeType = ${list.runtimeType}');
  print('list[1] = ${list[1]}');
  list[1] = 10;
  print('list[1] = ${list[1]}');
  try {
    print('list[1] = ${list[list.length]}');
  }catch (ex){
    print(ex.toString());
    //rethrow;
  }

  var constCollection = const [1, 2, 3];
  //constCollection[1] = 10; //causes an error

  //constant variables must be initialzied with constant value
  //const List<int> constListReference  = new List();  //causes an error

}

void mapsDemo() {
  var gifts = {
    'first' : 'partridge',
    "second" : "turtledoves",
    "fifth" : 'golden rings',
  };

  var nobleGases = {
     2: 'helium',
  10: 'neon',
  18: 'argon',
  };
  nobleGases.putIfAbsent(36 , () => "krypton");
  nobleGases[54] = 'Xenon';
  nobleGases.update(86, (String currentKey) => 'Radon', ifAbsent: () => 'Radon');
  print('gifts: ${gifts}, runtimeType = ${gifts.runtimeType}');
  print('nobleGases: ${nobleGases}, runtimeType = ${nobleGases.runtimeType}');
  // If you try to add the wrong type of value to either map, the analyzer or runtime raises an error. 

  //using map constructor
  var fruitBasket = new Map();
  fruitBasket['Apple'] = 2;
  fruitBasket['Orange'] = 4;
  print('frutiBAsket : ${fruitBasket}, runtimeType = ${fruitBasket.runtimeType}');

  //constant map
  final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
  };
  //constantMap[2] = 'Helium'; // Uncommenting this causes an error.
} 

void runesDemo() {
  var clapping = '\u{1f44f}';
  print('clapping : ${clapping}, runtimeType: ${clapping.runtimeType}');
  
  Runes emojis = new Runes('''
  \u0041 \u{0041} \u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}
  '''.trim());
  print('emojis : ${String.fromCharCodes(emojis)}');
}

void symbolsDemo() {
  var anIdentifier = 10;
  Symbol anIdentifierSymbol = #anIdentifier;
  print('anIdentifier value:${anIdentifier}, symbol: ${anIdentifierSymbol}');

  Symbol anIdentifierSymbol2 = new Symbol('anIdentifier');
  print('anIdentifierSymbol == anIdentifierSymbol2 : ${anIdentifierSymbol == anIdentifierSymbol2}');
}