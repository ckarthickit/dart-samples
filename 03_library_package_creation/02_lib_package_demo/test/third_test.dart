import 'package:test/test.dart';
import 'package:lib_package_demo/src/third.dart';


void main() {
	group('third.dart test', () {
		setUp(() {
			print('setting up third.dart test');
		});
		tearDown((){
			print('tearing down third.dart test');
		});
		test("thirdMethod" , () {
			expect(thirdMethod(), equals("thirdMethod invoked fourth.fourthMethod and it returned fourthMethod"));
		});
	});
}
