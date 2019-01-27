void printInteger(int aNumber) {
  print('number is $aNumber');
}

void main() {
  var someNumber = 21;
  printInteger(someNumber);
  //uncommenting the below code will result in compilation error 
  /**
   * The constructor returns type 'Object' that isn't of expected type 'int' 
   * [strong_mode_invalid_cast_new_expr]. 
   **/ 
  // someNumber = new Object();

  dynamic var2 = 21;
  print('var2 is ${var2}');
  /**
   * var2 is dynamic so , can be assigned anything
   **/
  var2 = new Object();
  print('var2 is ${var2}');

  //dart supports generics
  List<int> integerList = new List();
  integerList.add(1);
  List<dynamic> dynamicList = new List();
  dynamicList.add(1);
  dynamicList.add("value");
}