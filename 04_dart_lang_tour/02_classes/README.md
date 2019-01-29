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
  - Inheritance & Reuse
    - `extend` exactly one class.
    - `implements` many pure abstract classes. 
    - mix `with` many `mixin` classes.