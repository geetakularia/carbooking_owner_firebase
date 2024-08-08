import 'package:car_booking_owner/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    manageData.appColors.primary,
    manageData.appColors.primary,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.50,
            child: Padding(
              padding: const EdgeInsets.only(
                  // right: 18,
                  // left: 12,
                  // top: 24,
                  // bottom: 12,
                  ),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          // SizedBox(
          //   width: 60,
          //   height: 34,
          //   child: TextButton(
          //     onPressed: () {
          //       setState(() {
          //         showAvg = !showAvg;
          //       });
          //     },
          //     child: Text(
          //       'avg',
          //       style: TextStyle(
          //         fontSize: 12,
          //         color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('', style: style);
        break;
      case 2:
        text = const Text('mon', style: style);
        break;
      case 3:
        text = const Text('', style: style);
      case 4:
        text = const Text('tue', style: style);
      case 5:
        text = const Text('', style: style);
      case 6:
        text = const Text('wed', style: style);
      case 7:
        text = const Text('', style: style);
      case 8:
        text = const Text('thur', style: style);
      case 9:
        text = const Text('', style: style);
      case 10:
        text = const Text('fri', style: style);
      case 11:
        text = const Text('', style: style);
      case 12:
        text = const Text('sat', style: style);
      case 13:
        text = const Text('', style: style);
      case 14:
        text = const Text('sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: AppColors.green,
        //     strokeWidth: 1,
        //   );
        // },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: AppColors.orange,
        //     strokeWidth: 1,
        //   );
        // },
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     interval: 1,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 42,
        //   ),
        // ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
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
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            // color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            // color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 42,
        //     interval: 1,
        //   ),
        // ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      // borderData: FlBorderData(
      //   show: true,
      //   border: Border.all(color: const Color(0xff37434d)),
      // ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                // ColorTween(begin: gradientColors[0], end: gradientColors[1])
                //     .lerp(0.2)!
                //     .withOpacity(0.1),
                // ColorTween(begin: gradientColors[0], end: gradientColors[1])
                //     .lerp(0.2)!
                //     .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
