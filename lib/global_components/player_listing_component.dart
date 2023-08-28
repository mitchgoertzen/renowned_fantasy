import 'dart:ffi';

import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:flutter/material.dart';

import 'draggable_player.dart';

class PlayerItem{

  late final String playerID;
  late final Player player;
  late final PlayerDragManager dragManager;

  PlayerItem(this.player, this.dragManager) {
    playerID = player.last.hashCode.toString();
  }


  String getID(){
    return playerID;
  }

    double dragOpacity = 1;


 
 Padding getWidget(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: 20,
          color: Colors.white, 
          child: DraggablePlayer(player: player, dragManager: dragManager ,opac: dragOpacity,clearPreviousSlot: (String? s) => Void, location: '',)
          ),
      );
 }
}