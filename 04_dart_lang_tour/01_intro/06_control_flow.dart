void main() {
  forLoopDemo();
  print('=================='); 
  switchCaseDemo();
}

/****************************/
void forLoopDemo() {
  forEachDemo(print, [1,2,3]);
  print('=================='); 
  forInDemo();
}

void  forEachDemo(void aFuncion(dynamic element), Iterable iterable) {
  for (dynamic element in iterable) aFuncion(element);
}

void forInDemo() {
  var array = [1,"stirng", 2, new Object()];
  for(var item in array) {
    print(item);
  }
}

const OBJECT = const Object();
const NON_CONST_OBJECT = Object();
const STRING = r'String';
const NUMBER = 25.0;
void switchCaseDemo() {
  printType(OBJECT);
  printType(NON_CONST_OBJECT);
  printType(STRING);
  printType(NUMBER);
}

printType<T extends Object>(T option) {
  switch (option) {
    case OBJECT:{
      continue object; //More elegant way of handling Fall-Through
    }
    break;
    object:
    case NON_CONST_OBJECT:{
      print('Object');
    }
    break;
    default: {
      if(option is String) {
        print('string');
      }else if(option is num) {
        print('number');
      }
    }
  }
}