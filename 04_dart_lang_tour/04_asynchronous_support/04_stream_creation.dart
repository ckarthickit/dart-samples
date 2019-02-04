import 'dart:async';

void main() async{
  await for(var value in getDemoStream()) {
    print('demoStream: $value');
  }
  print('================');
  await for(var value in demoStreamFromAsycStart()){
     print('demoStreamFromAsycStart: $value');
  }
  print('================');
  await for(var value in transformAStream(getDemoStream())) {
    print('transformAStream: $value');
  }
  print('================');
  StreamController streamController = StreamController();
  streamController.add(1);
  streamController.add('event');
  streamController.add("asdadad");
  streamController.sink.add('another event via sink');
  await for(var value in streamController.stream) {
    print(value.toString());
  }
   print('================');
}

Stream<int> getDemoStream() {
  return  Stream<int>.fromIterable([1,2,3,4,5,6,7,'a'.runes.single,9,10]);
}
Stream<int> demoStreamFromAsycStart() async*{
  yield 1;
  yield 2;
  yield 3;
  yield 'a'.runes.single;
  yield 10;
}

Stream<String> transformAStream(Stream<int> stream) {
  return stream.map((value) {
    return '==$value==';
  });
} 



