
import 'dart:math';

import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class DraggablePlayer extends StatefulWidget {
   DraggablePlayer({super.key, required this.player, required this.opac, required this.dragManager, required this.location, required this.clearPreviousSlot});

  final double opac;
  final Player player;
  final PlayerDragManager dragManager;
  final Function(String? s) clearPreviousSlot;
  final String location;

  @override
  State<DraggablePlayer> createState() => _DraggablePlayerState();
}

class _DraggablePlayerState extends State<DraggablePlayer> {

  bool isDragged = false;
  double opacity = 1.0;


  Container playerBox(double height, double opacity){
    return Container(
          decoration: BoxDecoration(
            //TODO: match box with theme, update highlight colour when other player ids being dragged
            color: Colors.black.withOpacity(.1 / opacity),
            borderRadius: BorderRadius.circular(5)),
          height: height,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[Text(
                style: TextStyle(color: Colors.black.withOpacity(min(1, 1 / opacity))),
                playerInfoStringBuilder(widget.player))])
          ),
        );
  }
  
  
  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context, constraints) => Draggable(
      onDragCompleted: (){
        print('player placed in target: ${widget.player.last}');
        widget.clearPreviousSlot(widget.location);
      },
        onDragStarted: () {
         widget.dragManager.updatePlayerDrag(true, widget.player.positions);  //HERE
          //TODO: set colour of ineligible positions
          setState(() {
            isDragged = true;
          });
        },
        onDragEnd: (DraggableDetails d) {
          widget.dragManager.updatePlayerDrag(false, widget.player.positions);  //HERE
          //update here false, 1, pos
        },
        //TODO: change to isEnabled bool
        maxSimultaneousDrags: widget.player.first == '' ? 0 : 1,
        data: widget.player,
        //item while being dragged
        feedback: FeedbackWidget(
          constraints: constraints,
        child: playerBox(constraints.maxHeight, widget.opac * 2)),  //HERE
        //left behind while dragging
        childWhenDragging: playerBox(constraints.maxHeight,  widget.opac / 1.5),  //HERE
        //static item not being dragged
        child: playerBox(constraints.maxHeight, widget.opac),  //HERE
      ));
  }
  

}


  class FeedbackWidget extends StatelessWidget{
  final BoxConstraints constraints;
  final Widget child;
  const FeedbackWidget({Key? key, required this.child, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      child: Material(
        child: child,
      ),
    );
  }
}