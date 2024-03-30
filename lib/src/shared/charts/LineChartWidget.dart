import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<FlSpot> points;
  final String? yLabel;
  final String? xLabel;

  const LineChartWidget(this.points, {Key? key, this.xLabel, this.yLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LineChart(
      duration: const Duration(milliseconds: 150), // Optional
      curve: Curves.linear, // Optional
      LineChartData(
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: yLabel != null),axisNameWidget: Text(yLabel ?? "") ),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(xLabel ?? ""),
            sideTitles: SideTitles(
              showTitles: xLabel != null,
              getTitlesWidget: (value, _) {
                String text = '';

                switch (value.toInt()) {
                  case 1:
                    text = 'Jan';
                    break;
                  case 3:
                    text = 'Mar';
                    break;
                  case 5:
                    text = 'May';
                    break;
                  case 7:
                    text = 'Jul';
                    break;
                  case 9:
                    text = 'Sep';
                    break;
                  case 11:
                    text = 'Nov';
                    break;
                }
                return Text(text);
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: points,
            color: theme.colorScheme.primary,
            isCurved: true, // use smooth curve
            dotData: const FlDotData(
              show: true, //show dots
            ),
          ),
        ],
      ),
    );
  }
}
