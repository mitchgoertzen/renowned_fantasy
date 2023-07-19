import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:flutter/material.dart';

class DraggableItemTarget extends StatefulWidget {
  const DraggableItemTarget({super.key, required this.child, required this.callback, required this.position, required this.positionEligibility, required this.playerDragged, required this.positionIndex});

  final Widget child;
  final Function(Player? p, int? t, int? i) callback; 
  final Function(List<String>? l, int? t) positionEligibility; 
  final int position;
  final int positionIndex;
  final bool playerDragged;


  @override
  State<DraggableItemTarget> createState() => _DraggableItemTargetState();
}

class _DraggableItemTargetState extends State<DraggableItemTarget> {
  String label = 'waiting...';
  Color backgroundColor = Colors.white;
  Player player = Player('','', ['']);



  

  @override
  Widget build(BuildContext context) {


    // print(widget.position);
    // print(widget.positionIndex);

    return DragTarget<Player>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    color: widget.playerDragged ? backgroundColor.withOpacity(0.1): backgroundColor,
                    child: widget.child
                  );
                },
                onAccept: (data) {

                  widget.callback(data, widget.position, widget.positionIndex);
                  setState(() {
                    player = data;
                    backgroundColor = Colors.white;
                    label = 'waiting';
                  });
                },
                onWillAccept: (data) {
                  if (data != null) {

                    if(widget.positionEligibility(data.positions, widget.position)){
                      print('good');
                      setState(() {
                        backgroundColor = Colors.black.withOpacity(.1);
                      });
                    }else{
                      print('bad');
                    }

                    return true;
                  } else {
                    label = 'cannot accept';
                    return false;
                  }
                },
                onLeave: (data) {
                  setState(() {
                    backgroundColor = Colors.white;
                    label = 'waiting';
                  });
                },
              )
          ;
  }
}