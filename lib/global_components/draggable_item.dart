import 'package:flutter/material.dart';

class DraggableItemTarget extends StatefulWidget {
  const DraggableItemTarget({super.key});

  @override
  State<DraggableItemTarget> createState() => _DraggableItemTargetState();
}

class _DraggableItemTargetState extends State<DraggableItemTarget> {
  int acceptedData = 0;
  String label = 'waiting...';
  double h = 100.0;
  double w = 100.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: h,
              width: w,
              color: Colors.cyan,
              child: DragItem(),
            );
          },
          onAccept: (int data) {
            setState(() {
              acceptedData += data;

              label = 'waiting';
            });
          },
          onWillAccept: (data) {
            if (data! > 0) {
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
        ),
      ],
    );
  }
}

class DragItem extends StatefulWidget {
  const DragItem({super.key});

  @override
  State<DragItem> createState() => _DragItemState();
}

class _DragItemState extends State<DragItem> {
  bool isDragged = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Draggable(
        onDragStarted: () {
          setState(() {
            isDragged = true;
          });
        },
        data: 10,
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
          child: const Center(
            child: Text('Draggable'),
          ),
        ),
      ),
    ]);
  }
}
