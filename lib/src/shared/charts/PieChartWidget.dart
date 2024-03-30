import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSection {
  final Color color;
  final double value;
  final double radius;
  final String title;

  PieChartSection(
      {required this.color,
      required this.value,
      required this.radius,
      required this.title});
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget(this.sections, {super.key});

  final List<PieChartSection> sections;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              sections: sections
                  .map(
                    (e) => PieChartSectionData(
                        color: e.color,
                        radius: e.radius,
                        title: e.title,
                        value: e.value,
                        titleStyle: Theme.of(context).textTheme.bodyLarge),
                  )
                  .toList(),
              centerSpaceRadius: 50,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (BuildContext content, int currIndex) => ListTile(
              title: Text(
                "${sections[currIndex].value.toInt()} ${sections[currIndex].title}",
              ),
              leading: DecoratedBox(
                decoration: BoxDecoration(
                  color: sections[currIndex].color,
                ),
                child: const SizedBox(
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
