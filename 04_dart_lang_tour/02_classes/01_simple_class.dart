void main() {
  useConstructorDemo();
  print("=======================");
  
}

/****************************************/
class Point {
  int x;
  int y;

  Point(this.x, this.y);

}

/****************************************/

void useConstructorDemo() {
 Point p = new Point(2, 2);
 print('point p is $p');
}