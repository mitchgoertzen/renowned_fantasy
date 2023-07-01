import 'package:flutter/cupertino.dart';

class Player{

  Player(String f, String l){
    first = f;
    last = l;
     id = '$first $last'.hashCode;
  }

  late String first;
  late String last;
  late int id;
}