void main() {
  implementClassDemo();
  print("========================");
}


/************************************/

class Person {
  final _name;
  var _age;
  Person(this._name,this._age);
}

abstract class Serializable{

}

class Impostor implements Person, Serializable {
  var _hiddenAge = 30; //actually we have duplicate getter and setter for this as well
  get _name => 'Unknown';
  get _age => _hiddenAge;
  set _age(var age) => _hiddenAge = age; 

  String toString() {
    return 'name: $_name; age:$_age';
  }
}

void implementClassDemo() {
  Impostor impostor = new Impostor();
  print('impostor = $impostor');
  impostor._age = 40;
  print('impostor = $impostor');
  impostor._hiddenAge = 20;
  print('impostor = $impostor');
}