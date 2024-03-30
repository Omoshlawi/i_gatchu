import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarchartWidget extends StatelessWidget {
  final String? yLabel;
  final String? xLabel;

  const BarchartWidget(this.points, {super.key, this.xLabel, this.yLabel});

  final List<FlSpot> points;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
      BarChartData(
        barGroups: points
            .map(
              (e) => BarChartGroupData(x: e.x.toInt(), barRods: [
                BarChartRodData(
                    toY: e.y, color: Theme.of(context).colorScheme.primary)
              ]),
            )
            .toList(),
        // borderData: FlBorderData(
        //     border: const Border(bottom: BorderSide(), left: BorderSide())),
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
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
          leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: yLabel != null),
              axisNameWidget: Text(yLabel ?? "")),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }
}
