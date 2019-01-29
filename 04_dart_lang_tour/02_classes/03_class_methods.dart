import 'dart:math';
void main() {
  instanceMethodDemo();
  print("========================");
  getterSetterDemo();
}

/*********************************************/

class Point {
  num x;
  num y;
  Point(this.x, this.y);

  distanceTo(Point other) {
    num dx = this.x = other.x;
    num dy = this.y = other.y;
    return sqrt(dx * dx + dy * dy );
  }
}
void instanceMethodDemo(){
  Point p1 = Point(1, 2);
  Point p2 = Point(3, 4);
  print('distance between p1 and p2 = ${p1.distanceTo(p2)}');
}

/****************************************/

class Rectangle {

  num left, top , width, height; //automatically get getters and setters

  get right {
    return left + width;
  }
  set right (right){
    left = right - width;
  }

  num get bottom {
    return top + height;
  }
  //num get bottom => top + height; // short-hand getter syntax
  
  void set bottom (num bottom){
    top = bottom - height;
  }
  //set bottom(bottom) => top = bottom - height; //short-hand setter syntax

  num get perimeter => 2 * (width * height);
  

  Rectangle(this.left, this.top, this.width, this.height);

  String toString() {
    return '{top=$top, left=$left, widht=$width, height=$height}';
  }
}

void getterSetterDemo() {
  Rectangle rect = Rectangle(1, 1, 40, 80);
  print('rect = $rect');
  print('rect.bottom = ${rect.bottom}');
  rect.bottom = 101;
   print('rect.top after rect.bottom = 101 is ${rect.top}');
}

