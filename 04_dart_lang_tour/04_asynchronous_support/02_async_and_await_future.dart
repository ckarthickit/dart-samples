void main() async{
  asyncTest();
  awaitTest();
}

/*******************************************************/
void asyncTest() async{
  Future<int> asyncFunc1Ret = asyncFunc1();
  asyncFunc1Ret.then((val) => print('asyncTest:1: $val'));

  Future<int>  anotherAsyncFunc1Ret = anotherAsyncFunc1();
  anotherAsyncFunc1Ret.then((val)=>print('asyncTest:2: $val'));

  ///non-asyn function can trigger  some asynchronous stuff and return a future
  ///They only cannot await another future inside them 
  nonAsyncFunc().then((value)=> print('asyncTest:3: $value'));

  ///We cannot do a then on voidAyncFunc (or) try to assign the value returned by await
  ///These type of function might do something synchrounously within them
  var ret = voidAsyncFunc();
  ///Below line results in error. 
  ///print('ret.runtimeType= ${ret.runtimeType}');
  

  await awaitOnThisNonAsyncFunction();
}

bool isImplicitSyntax = false;

///async function always wrap the returned value in a future
Future<int> asyncFunc1() async {
  if (isImplicitSyntax) {
    return 10;
  } else {
    return Future.delayed(Duration(milliseconds: 10),()=>10);
  }
}

///If an async function calls another async function, implicit wrapping is not done
///as it already returns a Future
Future<int> anotherAsyncFunc1() async {
  if (isImplicitSyntax) {
    return asyncFunc1();
  } else {
    return Future.value(asyncFunc1()); // This also returns Future<int> because of [FutureOr] special Func
  }
}

Future<int> nonAsyncFunc() {
  //non-async function doesn't implicitly return Future
  //uncommenting below line will result in compilation error.
  //return 10; 

  //we can explicitly return a future from a nonAsync function
  return Future.value(10);
}

/// WE SHOULD NOT RETURN VOID FROM AN ASYNC FUNCTION AS PER LANGUAGE SPEC,
/// ALTHOUGH IT WOULD NOT RESULT IN COMPILATION ERROR.
Future<void> voidAsyncFunc() async{
  Future.delayed(Duration(milliseconds: 30)).then((_){
    print("voidAsyncFunc's internal future end");
    return null;
  });
}

void awaitOnThisNonAsyncFunction() {
  print('awaitOnThisNonAsyncFunction: 10');
  Future.delayed(Duration(milliseconds: 10),(){
    print("awaitOnThisNonAsyncFunction doesn't wait for this future to complete");
  });
}

/*******************************************************/
awaitTest() async{
  int value =  await asyncFunc2();
  print(value);
  value = await nonAsyncFunc2();
  print(value);
}

Future<int> asyncFunc2() async{

  return 10; 
}

nonAsyncFunc2() {
  return Future.value(10);
}