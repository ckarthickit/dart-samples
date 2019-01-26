import 'package:test/test.dart';
import 'package:lib_package_demo/src/fourth.dart';


void main() {
	group('fourth.dart test', () {
		setUp(() {
			print('setting up fourth.dart test');
		});
		tearDown((){
			print('tearing down fourth.dart test');
		});
		test("fourthMethod" , () {
			expect(fourthMethod(), equals("fourthMethod"));
		});
	});
}
