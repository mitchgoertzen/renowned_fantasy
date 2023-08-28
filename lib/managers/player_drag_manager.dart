import 'package:flutter/material.dart';

class PlayerDragManager with ChangeNotifier{

 bool playerBeingDragged = false;
 double dragOpacity = 1.0;
 List<String> positions = [];

 void updatePlayerDrag(bool d, List<String> p){
      !d ? dragOpacity = 1 : dragOpacity = 2;
      playerBeingDragged = d; 
      positions = p;
      notifyListeners();
  }

}