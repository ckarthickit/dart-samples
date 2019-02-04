void main() {

}

Stream<int> getDemoStream() {
  return  Stream<int>.fromIterable([1,2,3,4,5,6,7,'a'.runes.single,9,10]);
}

Stream<String> transformAStream(Stream<int> stream) {
  return stream.map((value) {
    return '==$value==';
  });
} 

int someMethods() async*{
  yield 1;
}

