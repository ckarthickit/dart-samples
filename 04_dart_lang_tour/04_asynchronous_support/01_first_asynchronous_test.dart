import 'dart:async';
/**
 *  main uses Future API
 *  method1 , method2 , method3 uses async and await
 * 
 *  method1, eventhough invoked first , has long wait-time and hence completes last.
 *  method2, eventhough doesn't explicitly return a future, implicitly will return a future when the body ends
 *  method3, eventhought explicitly return a string, since it's async , implicitly returns Future<String>.
 */
void main(){
  print('main: enter==');
  /*********************/
  function1()
  .then((String value) {
    print('func1Future value : $value');
  })
  .catchError(() {
    print('Error Occurred');
  });
  /*********************/
  Future<void> func2Future = function2();
  print('func2Future is $func2Future');
  /*********************/
  Future<String> func3Future = function3();
  print('func3Future is $func3Future');
  func3Future.then((String value){
    print('func3Future value : $value');
  });
  /*********************/
  function4();
  /*********************/
  print('main: exit==');
}

Future<String> function1() async {
  print('method1: enter==');
  await new Future.delayed(Duration(seconds: 4));
  print('method1: after await 4 secs');
  await new Future.delayed(Duration(seconds: 3));
  print('method1: after await 3 secs');
  Future<String> future = Future.delayed(Duration(milliseconds: 400), (){
    return 'method1: queued up future exit==';
  });
  print('method1: exit(with future queued up)==');
  return future;
}

Future<void> function2() async {
  print('method2: enter==');
  await new Future.delayed(Duration(seconds: 2));
  print('method2: after await 2 secs');
  await new Future.delayed(Duration(seconds: 1));
  print('method2: after await 1 secs');
  print('method2: exit==');
}

Future<String> function3() async {
  return 'method3: return-string exit==';
}

void function4() {
  print('method4: syncrhonous funtion: enter==');
  print('method4: syncrhonous funtion: exit==');
}