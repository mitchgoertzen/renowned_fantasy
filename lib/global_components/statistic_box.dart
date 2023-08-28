import 'package:flutter/material.dart';

class StatisticBox extends StatefulWidget {
  final List<String> xAxisLabels;
  final List<List<String>> yAxisValues;

  const StatisticBox(
      {super.key, required this.xAxisLabels, required this.yAxisValues});

  @override
  State<StatefulWidget> createState() => StatisticBoxState();
}

class StatisticBoxState extends State<StatisticBox> {
  @override
  Widget build(BuildContext context) {
    List<String> xLabels = widget.xAxisLabels;
    List<List<String>> yValues = widget.yAxisValues;

//TODO: add sorting options (xlabel will be clickable)
    yValues.sort((a, b) => a[4].compareTo(b[4]));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < xLabels.length; i++)
          Column(
            children: [
              Text(style: TextStyle(fontWeight: FontWeight.bold), xLabels[i]),
              for (int j = 0; j < yValues.length; j++) Text(yValues[j][i]),
            ],
          )
      ],
    );
  }
}
