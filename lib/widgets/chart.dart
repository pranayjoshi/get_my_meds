import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 2),
                FlSpot(2, 3),
                FlSpot(3, 4),
                FlSpot(4, 5),
                FlSpot(5, 6),
                FlSpot(6, 7),
              ],
              isCurved: true,
              colors: [Colors.blue],
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Progress Chart'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: WeeklyProgressChart(),
      ),
    );
  }
}