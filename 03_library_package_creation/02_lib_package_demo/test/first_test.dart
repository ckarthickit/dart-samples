import 'package:test/test.dart';
import 'package:lib_package_demo/src/first.dart';


void main() {
	group('first.dart test', () {
		setUp(() {
			print('setting up first.dart test');
		});
		tearDown((){
			print('tearing down first.dart test');
		});
		test("firstMethod" , () {
			expect(firstMethod(), equals("firstMethod"));
		});
	});
}
