void main() {
  constructorDemo();
  print("=======================");
  constConstructorDemo();
  print("=======================");
  factoryConstructorDemo();
  print("=======================");
}


/******************************/
class Point {
  int x;
  int y;

  Point(this.x, this.y);

  Point.usingInitializer(var x, var y): x = x, y = y , super();

  Point.normalParameter(int x, int y) {
    this.x = x;
    this.y = y;
  }

  String toString() {
    StringBuffer buffer = StringBuffer('{');
    buffer.write('x= $x');
    buffer.write('; ');
    buffer.write('y= $y');
    buffer.write('}');
    return buffer.toString();
  }
}

class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y) : super(); //shorthand constructor
  ImmutablePoint.nonConstContructor(this.x, this.y): super();//shorthand named constructor
  ImmutablePoint.initializer(num x, num y): x = x, y= y, super();//initializer list constructor
  ImmutablePoint.redirectingConstructo(num x, num y): this(x, y);
}

class SubImmutablePoint extends ImmutablePoint {
  SubImmutablePoint.nonConstContructor(num x, num y): super.nonConstContructor(x,y);
}

/**************************************/

void constructorDemo() {
  Point shortHandPoint = Point(1, 2);
  print('shortHandPoint = $shortHandPoint');
  Point initializerPoint = Point.usingInitializer(3, 4);
  print('initializerPoint $initializerPoint');
  Point normalPoint = Point(8, 9);
  print('normalPoint $normalPoint');
}


void constConstructorDemo() {
  const ImmutablePoint point1 = ImmutablePoint(1, 2);
  const ImmutablePoint point2 = ImmutablePoint(1, 2);
  print('point1 == poin2? ${point1 == point2}');

   //uncommenting the below code causes compialtion error 
   //Reason : constant variable must be assigned only with a constant value.
  //const ImmutablePoint pointX = new ImmutablePoint(1, 2);

  ImmutablePoint point3 = ImmutablePoint(3, 4);
  ImmutablePoint point4 = new ImmutablePoint(7, 8);
  print('point3 == point4? ${point3 == point4}');

  //const cannot be used before non-constant constructor
  //const Point mutablePointx = const Point(2, 3);

}

/********************************************************/

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front of its name.
  static final Map<String,Logger> _cache = <String,Logger>{};

  Logger._internal(this.name) {

  }

  factory Logger(String name) {
    if(!_cache.containsKey(name)) {
      _cache[name] = Logger._internal(name);
    }
    return _cache[name];
  }

   void log(String msg) {
    if (!mute) print('$name: $msg');
  }
}

void factoryConstructorDemo() {
  Logger logger = new Logger("UI");
  logger.log('print this message');
}