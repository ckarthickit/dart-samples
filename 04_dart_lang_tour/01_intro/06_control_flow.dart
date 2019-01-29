void main() {
  forLoopDemo();
  print('=================='); 
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