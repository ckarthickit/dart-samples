# Library Package 

## pubspec.yaml 
- same as for an Application Package.

## lib directory 
- <span style="color:blue">Implementation code</span> is placed under `lib/src`.
- Code under `lib/src` is *"considered"* <span style="color:blue">private</span> (Implementors can change it anytime).
- To make APIs under `lib/src` <span style="color: blue">public</span>, <span style="color: blue">we can export `lib/src` files from a file 
  that's directly under `lib`</span>.


## Running Tests 
- Either run `pub run test` (or) `pub run test/test_all.dart` 
- `test` is the test folder name . 


