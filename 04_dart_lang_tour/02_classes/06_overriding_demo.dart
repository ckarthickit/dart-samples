void main() {
  extensionDemo();
  print('=================');
  operatorOverridingDemo();
  print('=================');
  implementHashCodePropertyAndEqualOperator();
  print('==================');
}


/********************************/
class Television {
   void turnOn() {
     print('NormalTV: Turn On');
   }
}

class SmartTelivision extends Television {
  @override
  void turnOn() {
    super.turnOn();
    print('Smart TV: Turn On');
  }
}

void extensionDemo() {
  Television television = SmartTelivision();
  television.turnOn();
}
/*******************************/

class Vector {
  final int x,y;
  Vector(this.x, this.y);

  Vector operator +(Vector other) => Vector(this.x + other.x, this.y + other.y);
  Vector operator -(Vector other) => Vector(this.x - other.x, this.y - other.y);

  String toString() {
    return '{x: $x, y:$y }';
  }
}

void operatorOverridingDemo() {
  final v = Vector(2, 3);
  final x = Vector(2, 2);
  print('v = $v');
  print('x = $x');
  print('v + x = ${v + x}');
  print('v - x = ${v - x}');
}

/**************************************/

class Point extends Object{
  final num x, y;
  Point(this.x, this.y);

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + x;
    result = 37 * result + y;
    return result;
  }

  bool operator ==(dynamic other) {
    if(other is! Point) return false;
    if(other.x != this.x) return false;
    if(other.y != this.y) return false;
    return true;
  }
}

void implementHashCodePropertyAndEqualOperator() {
  Point p1 = new Point(1, 2);
  Point p2 = new Point(3, 4);
  Point p3 = new Point(1, 2);

  print('p1 = $p1');
  print('p2 = $p2');
  print('p3 = $p3');
  print('p1==p2? ${p1 == p2}');
  print('p1==p3? ${p1 == p3}');
}