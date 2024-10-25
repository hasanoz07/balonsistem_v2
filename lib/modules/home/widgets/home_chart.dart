import 'dart:async';
import 'dart:math';
import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/extensions/color_ext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeChart extends StatefulWidget {
  // Accept dataValues and dataLabels as parameters
  final List<double> dataValues;
  final List<String> dataLabels;

  HomeChart({
    super.key,
    required this.dataValues,
    required this.dataLabels,
  });

  List<Color> get availableColors => <Color>[
        AppColors.instance.dodgerollGold,
        AppColors.instance.oceanDepths,
      ];

  final Color barBackgroundColor =
      AppColors.instance.rustesdCard.darken().withOpacity(0.3);
  final Color barColor = AppColors.instance.rustesdCard;
  final Color touchedBarColor = AppColors.instance.rustesdCard;

  @override
  State<StatefulWidget> createState() => HomeChartState();
}

class HomeChartState extends State<HomeChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Haftalık Forecast',
                style: TextStyle(
                  color: AppColors.instance.rustesdCard,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: BarChart(
                  isPlaying ? randomData() : mainBarData(),
                  swapAnimationDuration: animDuration,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: AppColors.instance.rustesdCard,
              ),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    refreshState();
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 28,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  // Generate bar groups based on dynamic dataValues
  List<BarChartGroupData> showingGroups() =>
      List.generate(widget.dataValues.length, (i) {
        return makeGroupData(
          i,
          widget.dataValues[i],
          isTouched: i == touchedIndex,
        );
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          // Tooltip
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            // Use dynamic labels
            int index = group.x;
            String label = '';
            if (index >= 0 && index < widget.dataLabels.length) {
              label = widget.dataLabels[index];
            }
            // Tooltip content
            return BarTooltipItem(
              '$label\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.white, // widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
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
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  // Generate x-axis labels based on dynamic dataLabels
  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    int index = value.toInt();
    if (index >= 0 && index < widget.dataLabels.length) {
      Widget text = Text(widget.dataLabels[index], style: style);
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16,
        child: text,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // Animation function remains mostly unchanged
  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // Generate random bar groups based on dynamic data length
      barGroups: List.generate(widget.dataValues.length, (i) {
        return makeGroupData(
          i,
          Random().nextInt(15).toDouble() + 6,
          barColor: widget
              .availableColors[Random().nextInt(widget.availableColors.length)],
        );
      }),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
