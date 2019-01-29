void main() {
  Performer performer = Mastero('Illay');
  (performer as Mastero).doSomething();
  (performer as Mastero).entertainMe();
  (performer as Mastero).checkAndPerform();
  performer.perform();
}

/*********************************************/

class Performer {
  Performer();
  Performer._internal();

  void perform() {
   print('performer needs to perform'); 
  }
}
class Mastero extends Performer with Musical, Aggressive, Demented {
  final String name;
  Mastero(this.name) : super._internal(){
    this.canConduct = true;
  }

  @override
  void perform() {
    super.doSomething();
    super.entertainMe();
  }
}

mixin Musical{
  bool canPlayPiano;
  bool canConduct;

  void entertainMe() {
    if(this.canPlayPiano ?? false) {
      print('playing Piano');
    }else if(this.canConduct ?? false) {
      print('Waving hands');
    }else {
      print('Humming to self');
    }
  }
}

mixin Aggressive {

  void doSomething(){
    print('Agressvely do something');
  }
}

mixin Demented on Performer{
  bool canGetAngry;
  void doSomething() {
    if(this.canGetAngry ?? false) {
      print('shout out!');
    }else {
      print('show attitude');
    }
  }

  void checkAndPerform() {
    super.perform();
  }
}