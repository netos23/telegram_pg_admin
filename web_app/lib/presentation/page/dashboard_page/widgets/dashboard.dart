import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:web_app/domain/entity/dashboard.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    required this.dashboard,
  });

  final Dashboard dashboard;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  List<Color> gradientColors = [
    Colors.deepPurple,
    Colors.blue,
  ];
  List<Color> predictColors = [
    Colors.orange,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                mainData(),
              ),
            ),
            Text(widget.dashboard.name),
          ],
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    return Text(
      value.toString(),
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    var dateTime = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
        style: style,
      ),
    );
  }

  LineChartData mainData() {
    final theme = Theme.of(context).colorScheme;
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: theme.onSurface,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          final dashBoard = widget.dashboard;
          final l = dashBoard.units[dashBoard.units.length-1];
          final r = dashBoard.predictions[0];
          if(l.timestamp <= value && value <= r.timestamp){
            return FlLine(
              color: theme.error,
              strokeWidth: 0.5,
            );
          }

          return FlLine(
            color: theme.onSurface,
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            interval: 1000,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: theme.onSurface),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: widget.dashboard.units
              .map(
                (e) => FlSpot((e.timestamp), e.value ?? 0),
              )
              .toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),

        LineChartBarData(
          spots: widget.dashboard.predictions
              .map(
                (e) => FlSpot((e.timestamp), e.value ?? 0),
          )
              .toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: predictColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
