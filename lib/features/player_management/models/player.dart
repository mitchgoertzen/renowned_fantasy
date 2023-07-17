class Player{

  Player(String f, String l, List<String> p){
    first = f;
    last = l;
    positions.addAll(p);
     id = '$first $last'.hashCode;
  }

  late String first;
  late String last;
  //TODO: convert to List<int>
  List<String> positions = ['x']; 
  late int id;
}