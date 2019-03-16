import 'package:stack_trace/stack_trace.dart';

void main() {
  printIterables();
  print('====================');
  //printStreams();
}

printIterables() {
  for (var i in naturalsDownFrom1(4)) {
    print('naturalsDownFrom1:$i');
  }
  print('=====================');
  Iterable ndemo2 = naturalsDownFrom2(4);
  //print('naturalsDownFrom2 len: ${ndemo2.length}');
  for (var i in ndemo2) {
    print('naturalsDownFrom2:$i');
  }
  print('=====================');
  for (var i in naturalsDownFrom(4)) {
    print('naturalsDownFrom:$i');
  }
}

printStreams() async {
  await for (var i in streamNaturalsDownFrom1(4)) {
    print('streamNaturalsDownFrom1:$i');
  }
  print('=====================');
  Stream ndemo2 = streamNaturalsDownFrom2(4);
  //Uncommenting the below "length" getter code will result in:
  //Bad state: Stream has already been listened to.
  /* int len = await ndemo2.length;
  print('${ndemo2.runtimeType}=> len:${len}'); */
  await for (var i in ndemo2) {
    print('streamNaturalsDownFrom2:$i');
  }
  print('=====================');
  await for (var i in streamNaturalsDownFrom(4)) {
    print('streamNaturalsDownFrom:$i');
  }
}

Iterable naturalsDownFrom1(n) sync* {
  if (n > 0) {
    yield n;
    // This yield is not passed back to the caller who triggerred the recursion
    naturalsDownFrom1(n - 1);
  }
}

Iterable naturalsDownFrom2(n) sync* {
  //print('n=====>$n');
  if (n > 0) {
    print('gonna yield n: $n');
    yield n;
    print('yielded n: $n');
    for (int i in naturalsDownFrom2(n - 1)) {
      //make the below block true to make things interesting
      if (false) {
        print('n:${n}=> gonna yield i: ${i * 10}');
        yield i * 10;
        print('n:${n}=> yielded i: ${i * 10}');
      } else {
        print('n:${n}=> gonna yield i: ${i}');
        yield i;
        print('n:${n}=> yielded i: ${i}');
      }
    }
  }
}

Iterable naturalsDownFrom(n) sync* {
  if (n > 0) {
    print('gonna yield $n');
    yield n;
    print('yielded $n');
    //StackTrace trace = StackTrace.current;
    //String member = Trace.current().frames[0].member;
    //print('${member}: $n');
    yield* naturalsDownFrom(n - 1);
  }
}

Stream streamNaturalsDownFrom1(n) async* {
  if (n > 0) {
    yield n;
    // This yield is not passed back to the caller who triggerred the recursion
    streamNaturalsDownFrom1(n - 1);
  }
}

Stream streamNaturalsDownFrom2(n) async* {
  if (n > 0) {
    yield n;
    //print('yielded n: $n');
    await for (int i in streamNaturalsDownFrom2(n - 1)) {
      yield i;
      //print('yielded i $i');
    }
  }
}

Stream streamNaturalsDownFrom(n) async* {
  if (n > 0) {
    yield n;
    //StackTrace trace = StackTrace.current;
    //String member = Trace.current().frames[0].member;
    //print('${member}: $n');
    yield* streamNaturalsDownFrom(n - 1);
  }
}
