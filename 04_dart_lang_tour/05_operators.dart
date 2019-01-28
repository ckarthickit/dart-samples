void main() {
  typeTestOperatorsDemo();
  print("================");
  assignmentDemo();
  print("================");
  conditionalOperatorDemo();
  print("================");
  cascadeOperatorDemo();
  print("================");
  conditionalMemberAccessDemo();
  print("================");
}
/*************************************/

class Person {
  String name;
}
class Employee extends Person {
  int employeeID;
}
void typeTestOperatorsDemo() {

  //is operator
  num aNumber = 2;
  print('aNumber= ${aNumber}, aNumber is int= ${aNumber is int}');
  aNumber = 3.4;
  print('aNumber= ${aNumber}, aNumber is! int= ${aNumber is! int}');
  print('aNumber= ${aNumber}, aNumber is double= ${aNumber is double}');

  //as operator
  Person person = Employee();
  person.name = "John";
  (person as Employee).employeeID = 12;
  person = null;
  //uncommenting the below code will raise an exception
  //(person as Employee).employeeID = 12;
}

/*************************************/

void assignmentDemo() {
  var b;
  b ??= 5;
  print('after b ??= 5, b is $b');
  b ??= 6;
  print('after b ??= 6;, b is $b');
}

/*************************************/

void conditionalOperatorDemo() {
  String playerName(String name) {
    return name ?? 'Guest';
  }
  print('playerName(null) : ${playerName(null)}');
  print('playerName("Sachin") : ${playerName("Sachin")}');
}

/***********************************/
class CascadeTester {
  String text;
  int id;
  Function callback;

  String toString() {
    return '{text: $text; id: $id; callback: $callback}';
  }
}
void cascadeOperatorDemo() {
  String aString = "  first  ";
  print('aString is: ($aString)');
  aString = aString.toUpperCase();
  print('aString is: ($aString)');

  CascadeTester cascadeTester = CascadeTester()
  ..text = "cascade_test"
  ..id = 10
  ..callback = () => print("something"); //print returns void
  print('cascadeTester: $cascadeTester');
  cascadeTester.callback();
}

/***************************************/

class ConditionalAccesDemo {
  String name;
  String secondName;
}
void conditionalMemberAccessDemo() {
  ConditionalAccesDemo accesDemo = ConditionalAccesDemo();
  accesDemo ..name = 'John' ..secondName = "Right";
  print('accesDemo.name= ${accesDemo.name}; accesDemo.secondName= ${accesDemo.secondName}');
  accesDemo = null;
  print('after null assignment accesDemo?.secondName=${accesDemo?.secondName}');
  //uncommenting the below code results in an error 
  //print('after null assignment accesDemo.secondName=${accesDemo.secondName}');
}