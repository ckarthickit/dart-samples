import 'package:test/test.dart';
import 'first_test.dart' as first_test;
import 'second_test.dart' as second_test;
import 'third_test.dart' as third_test;
import 'fourth_test.dart' as fourth_test;
void main() {
	group('first', first_test.main);
	group('second', second_test.main);
	group('third', third_test.main);
	group('fourth', fourth_test.main);
}