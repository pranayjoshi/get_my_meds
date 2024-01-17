import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeeklyProgressChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const WeeklyProgressChart(this.seriesList, { required this.animate});

  factory WeeklyProgressChart.withSampleData() {
    return new WeeklyProgressChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList, animate: animate);
  }

  static List<charts.Series<int, int>> _createSampleData() {
    final data = [
      new charts.Series<int, int>(
        id: 'Progress',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (int value, _) => value,
        measureFn: (int value, _) => value,
        data: [1, 2, 3, 4, 5, 6, 7],
      )
    ];

    return data;
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
        child: WeeklyProgressChart.withSampleData(),
      ),
    );
  }
}