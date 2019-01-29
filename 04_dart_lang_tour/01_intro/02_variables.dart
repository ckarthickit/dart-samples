
void main () {
  variableTypesDemo();
  defaultValuesDemo();
  finalAndConstVariablesDemo();
  constValuesDemo();
}

void variableTypesDemo() {
  { //type is inferred
    var aName = 'Bob';
  }
  { //dynamic type represent any type 
    dynamic aName = 'Bob';
  }
  { //Object type represent any "Object" type
    Object aName = 'Bob';
    Object aNumber = 21;
    print(21.toString());
  }
  {
    String anotherName = "John";
  }
}

void defaultValuesDemo() {
  int lineCount; 
  //assert(lineCount != null);
  if(lineCount == null) {
    print(lineCount);
  }
}

void finalAndConstVariablesDemo() {
  final name = 'Bob';
  final String nickName = 'Nick';

  //[dart] Members can't be declared to be both 'final' and 'var'. [final_and_var]
  //final var someName = '';
  const compileTimeConst = 1;
  final anotherCompileTimeConst = 2; //not different from const when used as a top-level variable

  
}
class FinalDemo {
  final int constProperty;
  String description;
  FinalDemo(this.constProperty, String description){
    this.description = description;
  }
}


void constValuesDemo() {
  var foo = const [];
  print(foo.runtimeType);

  const baz = []; //equivalent to const [];
  print(baz.runtimeType);

}