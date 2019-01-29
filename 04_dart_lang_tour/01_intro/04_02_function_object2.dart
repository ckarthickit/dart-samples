void main(List<String> args) {
  mainFunctionArgsDemo(args);
  print("=================");
  functionsAsObjectDemo();
  print("=================");
  anonymousFunctoinDemo();
  print("=================");
  lexicalScopeDemo();
  print("=================");
  lexialClosuresDemo();
  print("=================");
  functionEqualityDemo();
  print("=================");
  returnValueDemo();
  print("=================");
}

/*******************************************************************************/
void mainFunctionArgsDemo(List<String> args) {
  print('args.length = ${args.length}');
  if(args.length > 0) {
    print('args[0] = ${args[0]}');
  }
}
/*******************************************************************************/

void functionsAsObjectDemo() {
  //Note: Functions is defined inside a function .
  void printElement(int element) {
    print(element);
  }

  var list = [1,2,3];
  list.forEach(printElement);
}

/*******************************************************************************/

void anonymousFunctoinDemo() {
  var list = ['apples', 'oranges', 'pomegranate'];
  
  //anonymous funcition
  list.forEach((name) {
    print('${list.indexOf(name)}:${name}');
  });

  //anonymous arrow-function
  list.forEach(
    (name) => print('${list.indexOf(name)}:${name}')
    );
}

/*******************************************************************************/

var topLevel = 'topLevel';
void lexicalScopeDemo() {
  var lexicalScopeDemo = 'lexicalScopeDemo';
  void myFunction() {
    var myFunction = 'myFunction';
    
    void nestedFunction() {
      var nestedFunction = 'nestedFunction';

      print('nestedFunction value : $nestedFunction');
      print('myFunction value : $myFunction');
      print('lexicalScopeDemo value : $lexicalScopeDemo');
      print('topLevel value : $topLevel');
    } 
  }
}

/*******************************************************************************/

typedef Adder = num Function(num);
void lexialClosuresDemo() {
  Function makeAdder(num addBy) {
    bool useArrowSyntax = true;
    if(useArrowSyntax) {
      //addBy variable is captured .
      //So the returned function becomes a closeure function.
      return (num i) => i + addBy; 
    }else {
      //addBy variable is captured .
      //So the returned function becomes a closeure function.
      return (num i) {
        return i + addBy;
      };
    }
  }
  var add2 = makeAdder(2);
  var add3 = makeAdder(3);
  Adder typedAdd4 = makeAdder(4);
  print('add2(3) is :${add2(3)}');
  print('add3(5) is :${add3(5)}');
  print('typedAdd4(5) is :${typedAdd4(5)}');
}

/*******************************************************************************/
void topLevelFunc() {

}

class A{
  static void staticMethod() {

  }
  void instanceMethod() {

  }
}
void functionEqualityDemo() {
  var x;
  x = topLevelFunc;
  print('x == topLevelFunc? ${x == topLevelFunc}');

  x = A.staticMethod;
  print('x == A.staticMethod? ${x == A.staticMethod}');
   
  //comparing instance method.
  var v = new A();
  var w = new A();
  var y = w.instanceMethod;
  print('y == w.instanceMethod? ${y== w.instanceMethod}');

  //instance methods of 2 different instances of same Class are not equal.
  print('v.instanceMethod == w.instanceMethod? ${v.instanceMethod == w.instanceMethod}');
}

/*******************************************************************************/

void returnValueDemo() {
  print(returnValueTest(true));
  print(returnValueTest(false));
}
//uncommetning the void will result in compilation error.
/*void*/ returnValueTest(bool explicitReturn) {
  if(explicitReturn) {
    return;
  }
}
