void main(List<String> args) {
  functionDemo();
  print("=================");
  functionParamsDemo();
  print("=================");
  functionDefaultParamsDemo();
  print("=================");
}

typedef Compare = int Function(Object a, Object b);

Function functionDemoRef = functionDemo;

const _nobleGases = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
  36: "krypton",
  54: "xenon",
  86: 'Radon',
};

//function with type annotation
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

//function without type annotation
isNoble2(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

//short-hand syntax for "SINGLE EXPRESSION" functions. => expr is shorthand for {return expr;}
// Only an expression—not a statement—can appear between the arrow (=>) and the semicolon (;)
bool isNoble3(atomicNumber) => _nobleGases[atomicNumber] != null;

void functionDemo() {
  print('functionDemo = ${functionDemoRef}');
  
  Function isNobleRef = isNoble;
   print('isNoble = ${isNoble}');
  print('isNoble(18) = ${isNoble(18)}, isNoble.runtimeType = ${isNobleRef.runtimeType}');
  
  Function isNoble2Ref = isNoble2;
  print('isNoble2(92) = ${isNoble2(92)}, isNoble2.runtimeType = ${isNoble2Ref.runtimeType}');

  print('isNoble3(86) = ${isNoble3(86)}, isNoble3.runtimeType = ${isNoble3.runtimeType}');
}

/*************************************************************************/
void functionParamsDemo() {
  //two types of parameters : required ; optional
  print(positionedSay("John", "Hello Dart", "Macbook Pro"));
  print(namedSay(
    from: "John",
    msg: "Hello Dart",
    device: "Macbook Pro!"
  ));
}

//positioned parameters both required and optional
String positionedSay(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if(device != null) {
    result = '$result with a $device';
  }
  return result;
}

String namedSay({String from, String msg, String device}) {
  var result = '$from says $msg';
  if(device != null) {
    result = '$result with a $device';
  }
  return result;
}

/***************************************************************************/
//Optional Parameters can have default Values.
void functionDefaultParamsDemo() {
  print(defaultSay("John", "Hello Dart!"));
  print(defaulSay2());
}

String defaultSay(String from , String msg , [String device = "Macbook Pro!"]){
  var result = '$from says $msg';
  if(device != null) {
    result = '$result with a $device';
  }
  return result;
}

String defaulSay2({String from = "Karthick", msg="Hello Dart!", String device = "Macbook Pro"}) {
  var result = '$from says $msg';
  if(device != null) {
    result = '$result with a $device';
  }
  return result;
}