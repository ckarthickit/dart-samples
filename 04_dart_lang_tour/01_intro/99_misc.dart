// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';


main() {
  var parameters;
  parameters = populateInt();
  print(parameters.runtimeType);
  print(parameters is int);

  parameters = populateString();
  print(parameters.runtimeType);
  print(parameters is int);

  Exception e;
  Error error;

  try {
    throw new Error();
  }catch(e) {
    print('exception: ' + e.runtimeType.toString());
  }
}

populateInt() {
  return 2;
}

populateString() {
  if(true) {
    return 'Test';
  }
}

void stringBufferTest() {
  StringBuffer buffer = new StringBuffer();
  buffer 
  ..write("obj")
  ..write("obj1")
  ..writeAll(["asda", "asas"])
  ..write("obj2");
}
