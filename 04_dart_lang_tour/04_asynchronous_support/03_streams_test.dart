import 'dart:async';

import 'dart:io';

main() {
  createBasicStreamsDemo();
}

/*****************************************/

void createBasicStreamsDemo() {
  simpleCounterStream();
  simpleFileReadWriteDemo();
}

void simpleCounterStream() {
  print('creating stream');

  var counterStream =
      Stream<int>.periodic(Duration(milliseconds: 200), (counter) {
    print('computation counter: $counter');
    if (counter == 5) {
      throw 'i will throw $counter';
    }
    return counter * 100;
  }).takeWhile((value) => value < 20 * 100);

  StreamSubscription<int> subscription = counterStream.listen((int value) {
    print('listening stream value: $value');
  })
    ..onDone(() {
      print('==listening stream done==');
    })
    ..onError((error, stacktrace) {
      print('error: $error');
      print('stacktrace: $stacktrace');
    })
    ..onData((value) {
      //we are replacing onData callback that is passed to listen method
      print('onData: listening stream value: $value');
    });

  Future.delayed(Duration(seconds: 10), () {
      subscription.cancel();
  });
}

void simpleFileReadWriteDemo() async{
  File testFile = File('build/test.txt');
  await testFile.create(recursive: true);
  IOSink sink = testFile.openWrite(mode: FileMode.APPEND);
  Stream<String> streamOfStrings = Stream<String>.periodic(Duration(milliseconds: 500),(counter){
    if(counter == 10) {
      return null;
    }else {
      return 'File Line $counter\n';
    }
  }).takeWhile((value) => value != null);
  Stream<List<int>> integerStream = streamOfStrings.map((string){
    return string.codeUnits;
  });
  Future dumpFuture = sink.addStream(integerStream);
  dumpFuture.then((_){
    print('Done writing to the file');
    sink.flush();
    sink.close();
  }).then((_) async{
    Stream<List<int>> fileByteStream = testFile.openRead();
    Stream<String> fileStringStream = fileByteStream.map<String>((List<int> codePoints){
      return String.fromCharCodes(codePoints);
    });
    await for (String s in fileStringStream){
      print(s);
    }
  });
}
