import 'package:test/test.dart';
import 'package:lib_package_demo/src/second.dart';


void main() {
	group('second.dart test', () {
		setUp(() {
			print('setting up second.dart test');
		});
		tearDown((){
			print('tearing down second.dart test');
		});
		test("secondMethod" , () {
			expect(secondMethod(), equals("secondMethod"));
		});
	});
}
