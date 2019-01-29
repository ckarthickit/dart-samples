## Classes
  - Constructors 
    - cannot be inherited but can be chained.
    - names can either be `ClassName` (or) `ClassName.identifier` . 
    - Defaut Order of execution :
      - initializer list
      - super class's no-arg constructor.
      - main class 's no-arg constructor.
    - Right side of initializer `doesn't have access to this`.
    - manually invoking a super clas non-arg constructor must be done as part of initializer 
      just before constructor body.
    - `new` keyword is `optional` as of Dart 2.
    - *Redirecting Constructor*
      - redirects to another constructor of the same class.
      - Eg: 
        ```
          class Point {
            num x, y;

            // The main constructor for this class.
            Point(this.x, this.y);

            // Delegates to the main constructor.
            Point.alongXAxis(num x) : this(x, 0);
          }
        ```
    - *Constant Constructors*
      - Used to create compile-time constants of that particular class 
        - `compile-time constants` are created by prefixing `const` keyword `before const constructor  Invocation`.
      - `const` keyword is prefixed before constructor name.
      - `all instance variables` MUST BE `final`.
      - Eg: 
        ```
        class ImmutablePoint {
          static final ImmutablePoint origin =
              const ImmutablePoint(0, 0); //compile-time constant

          final num x, y;

          const ImmutablePoint(this.x, this.y);
        }
        ```
    - *Factory constructors*
      - `factory` key-word is prefixed before constuctor name.
      - doesn't always create new instance of it's class 
        - might return 
          1. `instance from cache` (or)
          2. an instance of `sub-type`
      - have `no-access to this`.
      - needs `explicit return` statement . So it's like a method but with the same name as class.
  - Instance Properties , Instace Methods , Getters & Setters
    - instance methods can access `instance variables/properties` and `this`.
    - Getters and Setters are `special methods` that  provide access to Object's `properties`.
      - apart from declaring instance variables (that are otherwise known as properties), we can
        create additional properties by implementing appropriate `get`ter and `set`ter methods.
  - *abstract* methods / classes
    - 2 types
      1. instance methods
      2. getter / setter (property access)methods 
    - exist only in `abstract` classes
    - Eg: 
      ```
        abstract class Doer {
          num get id;  //abstract getter
          void set id(num id); //abstract setter
          void doSomething(); //abstract instance methods
        }
      ```
    - `abstract classes` *CANNOT BE INSTANTIATED*.
      - Define a `factory constructor` to make abstract class appear to be instantiable.
  - *Implicit interfaces*
    - Every class `implicitly DEFINES (not implements)` an interface containing all the `instance members`
      of it, and any interfaces it implements
    - Requirement : <br/>
        Create `class A` that supports `class B`'s API `without inheriting class B's implementation`<br/>
      Solution : <br/>
        `class A` should implement `class B`  (Probably useful while writing mock implementations ?)
        
  - Inheritance & Reuse
    - `extend` exactly one class.
    - `implements` many abstract classes. 
    - mix `with` many `mixin` classes.