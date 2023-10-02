import 'dart:ffi';

import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:flutter/material.dart';

import 'draggable_player.dart';

class PlayerItem {
  late final String player;
  late final PlayerDragManager dragManager;

  PlayerItem(this.player, this.dragManager);

  String getID() {
    return player;
  }

  double dragOpacity = 1;

  Padding getWidget() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: 20,
          color: Colors.white,
          child: DraggablePlayer(
            player: player,
            dragManager: dragManager,
            opac: dragOpacity,
            clearPreviousSlot: (String? s) => Void,
            location: '',
          )),
    );
  }
}
