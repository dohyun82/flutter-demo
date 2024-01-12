import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///
/// fl_chart 라이브러리 데모
/// https://pub.dev/packages/fl_chart
///
class ChartDemo extends StatelessWidget {
  const ChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Chart 데모",
      home: ChartPage(),
    );
  }
}

///
/// 차트 홈
///
class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart 데모"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ChartBody(
          points: [
            PricePoint(1, 20000.0),
            PricePoint(2, 25000.0),
          ],
        ),
      ),
    );
  }
}

class PricePoint {
  final double x;
  final double y;

  const PricePoint(this.x, this.y);
}

class ChartBody extends StatelessWidget {
  final List<PricePoint> points;

  const ChartBody({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    double firstMonthPoint = points[0].y;
    double lastMonthPoint = points[1].y;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '지난 달  ${NumberFormat.simpleCurrency(
                locale: "ko_KR",
                name: "",
                decimalDigits: 0,
              ).format(firstMonthPoint)}원',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '이번 달  ${NumberFormat.simpleCurrency(
                locale: "ko_KR",
                name: "",
                decimalDigits: 0,
              ).format(lastMonthPoint)}원',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        BarChartWidget(points: points),
      ]),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key, required this.points});

  final List<PricePoint> points;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: BarChart(
          BarChartData(
            barGroups: _chartGroups(),
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(),
                right: BorderSide(),
              ),
            ),
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: _bottomTitles),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map(
          (point) => BarChartGroupData(
            x: point.x.toInt(),
            barRods: [
              BarChartRodData(
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                width: 40,
                toY: point.y,
                color: (point.x == 1) ? Colors.black : Colors.green,
              ),
            ],
          ),
        )
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return RotatedBox(
            quarterTurns: -1,
            child: Text('${NumberFormat.simpleCurrency(
              locale: "ko_KR",
              name: "",
              decimalDigits: 0,
            ).format(value)}원'),
          );
        },
      );
}

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> points;

  const LineChartWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: false,
              dotData: const FlDotData(
                show: false,
              ),
              color: Colors.red,
            ),
          ],
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
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
      );
}
