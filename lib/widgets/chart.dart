import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Weekly Progress',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Mon';
                                case 1:
                                  return 'Tue';
                                case 2:
                                  return 'Wed';
                                case 3:
                                  return 'Thu';
                                case 4:
                                  return 'Fri';
                                case 5:
                                  return 'Sat';
                                case 6:
                                  return 'Sun';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) => value.toInt().toString(),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 1),
                              FlSpot(1, 3),
                              FlSpot(2, 2),
                              FlSpot(3, 5),
                              FlSpot(4, 3),
                              FlSpot(5, 4),
                              FlSpot(6, 6),
                            ],
                            isCurved: false,
                            colors: [Theme.of(context).colorScheme.secondary],
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
