import 'package:flutter/material.dart';

Widget buildListingRow({
  required String name,
  required String owner,
  required String managerCount,
  required String dateCreated,
  TextStyle? style,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
      Expanded(
        child: Text(
          owner,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
      Expanded(
        child: Text(
          managerCount,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
      Expanded(
        child: Text(
          dateCreated,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    ],
  );
}
