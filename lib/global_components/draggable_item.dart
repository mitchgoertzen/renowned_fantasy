import 'package:flutter/material.dart';

class DraggableItemTarget extends StatefulWidget {
  const DraggableItemTarget({super.key});

  @override
  State<DraggableItemTarget> createState() => _DraggableItemTargetState();
}

class _DraggableItemTargetState extends State<DraggableItemTarget> {
  String acceptedData = '';
  String label = 'waiting...';
  double h = 100.0;
  double w = 100.0;
  String name = '2';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child:       
              DragTarget<String>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return 
                        Container(
              color: Colors.amber,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(label),
                  DragItem(name: name),
                ],
              ),
            )
            
            ;
          },
          onAccept: (String data) {
            setState(() {
              acceptedData = data;
name = data;
              label = 'waiting';
            });
          },
          onWillAccept: (data) {
            if (data != null) {
              print('will accept');
              setState(() {
                label = 'will accept';
              });
              return true;
            } else {
              label = 'cannot accept';
              return false;
            }
          },
          onLeave: (data) {
            setState(() {
              label = 'waiting';
            });
          },
        ),)
            
          //   Container(
          //     color: Colors.amber,
          //     height: 100,
          //   ),
          // )
          
          ]));

  }
}

class DragItem extends StatefulWidget {
  const DragItem({super.key, required this.name});


  final String name;

  @override
  State<DragItem> createState() => _DragItemState();
}

class _DragItemState extends State<DragItem> {
  bool isDragged = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Draggable(
        onDragStarted: () {
          setState(() {
            isDragged = true;
          });
        },
        data: widget.name,
        //item while being dragged
        feedback: Container(
          color: Colors.deepOrange,
          height: 100,
          width: 100,
          child: const Icon(Icons.directions_run),
        ),
        //left behind while dragging
        childWhenDragging: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.pinkAccent,
          child: const Center(
            child: Text('Child When Dragging'),
          ),
        ),
        //static item not being dragged
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.lightGreenAccent,
          child: Center(
            child: Text('Draggable ${widget.name}'),
          ),
        ),
      ),
    ]);
  }
}
