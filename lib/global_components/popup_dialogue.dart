import 'package:flutter/material.dart';

Widget buildPopupDialog(BuildContext context, VoidCallback onAccept, VoidCallback onDecline,
String title, Text info) {
  return  AlertDialog(
    title: Text(title),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [info,]
    ),
    actions: [
             TextButton(
        onPressed: onDecline,
        //textColor: Theme.of(context).primaryColor,
        child: const Text('No'),
      ),
       TextButton(
        onPressed: () => {
          onAccept(),
        },
        //textColor: Theme.of(context).primaryColor,
        child: const Text('Yes'),
      ),
    ],
  );
}