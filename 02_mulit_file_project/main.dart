/** 
 * Built-in types, collections, and other core functionality for every Dart program.
 */
import "dart:core"; //This Core library is automatically imported.

/**
 * 
 */
import "dart:math"; // Importing Core Libraries

import "lib/second.dart";

void main() {
	Uri dartlang = Uri.parse('http://dartlang.org/');
	print("dartlang uri = " + dartlang.toString());
	print("I'm acessing another dart file ;)");
	seondFileMethod();
}

