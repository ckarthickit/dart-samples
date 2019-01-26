import 'package:lib_package_demo/lib_umbrella.dart';
import 'package:lib_package_demo/src/fourth.dart';

void main() {
	print("A Library Package Demo:");
	print(firstMethod());
	print(secondMethod());
	print(thirdMethod());
	print(fourthMethod()); //not in umbrella header but imported directly 
}
