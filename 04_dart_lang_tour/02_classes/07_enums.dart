enum Color{
  RED,
  YELLOW,
  ORANGE,
}

void main() {
  Color color = Color.YELLOW;
  print('color = ${color}, index=${color.index}, toString=${color.toString()}');
}