import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:flutter/material.dart';

class PlayerStats extends StatelessWidget {
  var years = [2023, 2022, 2021, 2020];
  var stats = 10;

  var statTypes = ['GP', 'R', 'H', 'HR', 'RBI', 'SB', 'AVG', 'OPS'];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          createStatSection('Batting Stats'),
          createStatSection('Advanced Stats'),
          createStatSection('Game Logs'),
        ]));
  }
}

//horizontal elements for each stat section
Column createStatSection(String title) {
  var statTypes = ['year', 'GP', 'R', 'H', 'HR', 'RBI', 'SB', 'AVG', 'OPS'];

  return Column(children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
    sectionContainer(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var t in statTypes)
          if (t == 'year') statColumn(true, ' ') else statColumn(false, t)
      ],
    )),
    SizedBox(
      height: 15,
    )
  ]);
}

//vertical elements for each stat section
Column statColumn(bool year, String header) {
  var years = [2023, 2022, 2021, 2020];
  if (year) {
    header = " ";
  }

  return Column(
    children: [
      Text(
        header,
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
      for (var y in years)
        Column(
          children: [
            if (year)
              Text(
                '$y',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              )
            else
              Text(
                '01',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
          ],
        ),
    ],
  );
}
