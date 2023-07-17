import 'package:flutter/material.dart';

class PlayerDragManager with ChangeNotifier{

 bool playerBeingDragged = false;
 double dragOpacity = 1.0;
 List<String> positions = [];


 void updatePlayerDrag(bool d, List<String> p){
    print('player drag has been updated');
      //           not dragged 1/1   dragged 1/5
      !d ? dragOpacity = 1 : dragOpacity = 2;
      playerBeingDragged = d; 
     // dragOpacity = o;
      positions = p;
      notifyListeners();
  }

}