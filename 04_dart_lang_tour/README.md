# Important Concepts

## Everything we place in a variable is an object.
  - Every <span style="color:cyan">object</span> is instance of a `class`
  - All <span style="color:cyan">objects</span> inherit from `Object` class.
  - Even  `numbers`, `functions` and `null` are objects.

## Dart is `strongly typed`
  - type annoataion is optional as `dart can infer types` at compile time.
    ```
    var number = 42;
    ```
    In the above code, `number` is inferred to be if type `int`
  - `dyanmic` is used when we want to say that `no type is expected`.
    ```
    var aNumber = 42;

     /**
      * The constructor returns type 'Object' that isn't of expected type 'int' 
      * [strong_mode_invalid_cast_new_expr]. 
      **/ 
    aNumber = new Object(); // compilation error
    ```
    ```
    dynamic var2 = 21;
    /**
     * var2 is dynamic so , can be assigned anything
     */
    var2 = new Object(); // no compilation error
    ```

## Dart supports `generic` types
  - `List<int>` is a list of integers.
  - `List<dynamic>` is a list of objects of any type.

## Types of Functions & Variables
  - top level functions/variables (Eg., `main()` function , variables outside of a class).
    - We can create functions within functions (nested or local functions).
  - functions/variables tied to a class - `static` methods inside a class.
  - functions/variables tied to an object - instance methods inside a class.
    - instance variables are sometimes called `fields` or `properties`.

## Visibility of identifiers
  - Identifiers starting with <span style="color:cyan">`_`</span> are private to it's library.
    - <span style="color:cyan">Libraries not only provide APIs, but are a unit of privacy. </span>
    - <span style="color:cyan">The import and library directives can help you create a modular and shareable code base.</span>

## Dart `Expressions` and `Statements`
  - expressions have run-time values  (Eg., conditional expression `codition? expr1 : expr2`).
  - Statements doesn't have run-time values  (Eg., `if-else` statement).

## Dart Tools - Classification of Problems
  - `warnings` - indications that code might not work, but doesn't prevent from executing.
  - `errors` 
    - `compile-time` - prevent the code from executing at all.
    - `run-time` - result in an <span style="color:cyan">exception</span> being raised while the code executes.

## Dart built-in types
  - numbers
  - strings
  - booleans
  - lists (also known as arrays)
  - maps 
  - runes (for expressing `Unicode characters` in string)
    - are the UTF-32 code points of a string.
    - extends `Iterable<int>`.
    - UTF 32 code point Eg:  ```var clapping = '\u{1f44f}';```
    - Runes Eg: 
      ```
      Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
      print(new String.fromCharCodes(input));
      ```
  - symbols 
    - represents an `operator or identifier` declared in a Dart program
    - they’re <span style=color:red>invaluable for APIs that refer to identifiers by name</span>, because minification changes identifier names but not identifier symbols.
    - To get the symbol for an identifier, `use a symbol literal`, which is just <span style=color:orange># followed by the identifier</span>.
    - symbol literals are `compile-time constants`.

## Variable Assignment 
 - Const variables must be initialized with a constant value.

## Functions
 - are objects of type `Function`.
 - `Type annotations` can be `ommitted`, in which case, the type will be `inferred as dynamic`.
 - `Function Parameter Types`
   - Required Parameters. - Are listed first 
     - Positional parameters. ```(var variable1, var variable2)```
     - Named parameters with `@required` annotation. ```({@required var variableName})```
   - Optional Parameters.
     - Types :
       - Optional Positional parameters. ```([var variableName])```
       - Optional Named parameters. ```({var variableName})```
     - Optional parameters can have a `default value`. 
       - ```([var variableName=<default_value>])```.   
       - ```({var variableName=<default_value})```.
 - `Anonymous Functions` (or) `lambda` (or) `Closures`
   - Format:
     ```
     ([[Type] param1[, …]]) {
       codeBlock;
     }; 
     ```
  - Lexical Scope 
    - Innermost function can access outer scope variables
  - Lexical Closure:
    - <span style="color:orange">A closure is a function object that has access to variables in its lexical scope, `even when the function   is used outside of its original scope`.</span>
  - `Return Value`:
    - <span style="color:orange">all functions (`that doesn't have explicit void return type`) return a value</span> .
    - if no return value specified , `return null;` is implicitly appended to function body.
  - `Functions cannot be overloaded` (instead) we can use `named parameters / optional positioned parameters`.
  - `Callback Functions`
    - As `_` is a valid identifier , it's often used to ignore an extra param that is not needed 
      in callback
    - Eg.,
      ```
      void callback(int aNumber, _, __) {
        print('I accept a first arguement number and ignore second(_) and third(__)');
      }
      callback(1,2,3); //Here arguement 2 and 3 are name using underscores as they aren't needed
      ```

## Operators
- For operators that work on two operands, <span style="color:orange">the leftmost operand determines which version of the operator is used</span>.
- Type test operators : 
  - `as` - used for `Typecast` (or) `Library Prefix`.
  - `is` - true, if object has the specified type.
  - `is!` - false, if the object has the specified type.
- Assignement operators:
  - `??=` - assigns ONLY IF assign-to variable is null.
- Conditional Operators:
  - `expr1 ?? expr2`
    - If `expr1` is non-null, returns its value; otherwise, evaluates and returns the value of `expr2`.
      - ```
        var aName; 
        var otherName; 
        var playerName = aName ?? otherName;
        ```
- Cascade Operator ("...")
  - allows us to make `sequence of operations on the same object`. 
  - construct your `cascade on a function` that returns an actual object. (Useful on a builer class)
    - ```
      final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
      .build();
      ```
  - <span style="color:red"> can’t construct a cascade on void.</span>
  - strictly speaking `".."` is not an operator but part of `Dart Syntax`.
- Member Access Opeartor
  - `.` used to access members of a class
  - `?.` checks if the instance is null , and acesses the property on the right hand.

## Control Flow Statements
  - for loop 
    - `traditional` for loop that keeps track of `index`.
    - `Iterable` objects an use `forEach()` method.
    - `Iterable` objects can use `for-in` loop if `index` is not needed. 
  - swith - case 
    - Switch statements in Dart compare `integer`, `string`, or `compile-time constants` using `"=="`.
    - Compared objects must all be instances of `same class` (`and NOT of any of it's subtypes`)
    - Compared objects - Class `MUST NOT override "=="`.
    - `Enumerated Types` work well with switch-case.
    - Specials : 
      - `non-empty` case clause without break is an error.
      - `empty` case clause without break is treated as `fall-through`.
      - `explicit fall-through` can be achieved with `continue <label>;`
        - Eg: 
          ```
          var command = 'CLOSED';
          switch (command) {
            case 'CLOSED':
              executeClosed();
              continue nowClosed;
              // Continues executing at the nowClosed label.

            nowClosed:
            case 'NOW_CLOSED':
              // Runs for both CLOSED and NOW_CLOSED.
              executeNowClosed();
              break;
          }
          ```
  - assert s
    - `assert` statement distrupts normal executing if an expression evaluates to `false`. 

## Exceptions 
  - Types of Abnormalities .
    - Exception (`abstract class Exception`) - failure that can be addressed `programatically`
      - can be caught and mitigated.
    - Error  - failure that should have been avoided by the programmer
      - caller should not expect (or) catch errors.
      - terminating the program is the safest response.
      - has a `stackTrace` property
  - All exceptions are `unchecked`.
  - Any `non-null` object can be thrown - (`Throwing need not mean abnormality`).
    - Eg., 
      ```
        throw 'Out of llamas!';
      ```
  - Catch Clause 
    - Eg: 
      ```
      try {
        breedMoreLlamas();
      } on OutOfLlamasException { //catches the Exception, but DOES NOT capture the exception object.
        // A specific exception
        buyMoreLlamas();
      } on Exception catch (e) {
        // Anything else that is an exception
        print('Unknown exception: $e');
      } catch (e, s) { //e is the exception; s is the stacktrace
        // No specified type, handles all
        print('Something really unknown: $e');
      }
      ```
    - Must be arranged in order from more precise (sub-class) to less-precise catch clause.
    - use `rethrow` keyword `"inside a catch block"` to propogate a `partially - handled` exception.
  - finally
    - finally clause `runs AFTER matching catch clause`.
    - if no catch clause matches the exception , it is propogated `after the finally clause runs`. 

## Classes
  - Constructors 
    - names can either be `ClassName` (or) `ClassName.identifier` . 
    - `new` keyword is `optional` as of Dart 2.
  - Inheritance & Reuse
    - `extend` exactly one class.
    - `implements` many pure abstract classes. 
    - mix `with` many `mixin` classes.

## Generics
  - Required for type-safety.
  - Reduces Code duplication.
  - Can be used with Literals as well
    - Eg: 
      ```
        var names = <String>['Seth','Kathy', 'Lars`];
        var pages = <String,String> {
          'index.html': 'Homepage',
          'robots.txt': 'Hints for web robots',
          'humans.txt': 'We are people, not machines'
        };
      ```
  - Can be used with constructors (`both un-named and named`)
    - Eg: 
      ```
        var names = List<String>();
        names.addAll(['Seth', 'Kathy', 'Lars']);
        var nameSet = Set<String>.from(names);
          
        //The following map has integer keys with values of type View.
        var views = Map<int, View>();
      ```
  - `Generic type information are carried around at runtime`. (Unlike JAVA)
    - Eg: 
      ```
        var names = List<String>();
        names.addAll(['Seth', 'Kathy', 'Lars']);
        print(names is List<String>); // true
      ```
  - Generics can be restricted 
    - Eg:  `<T extends Stream>`
  - Generic Methods are supported
    - Eg:
      ```
      T first<T>(List<T> ts) {
        // Do some initial work or error checking, then...
        T tmp = ts[0];
        // Do some additional checking or processing...
        return tmp;
      }
      ```





