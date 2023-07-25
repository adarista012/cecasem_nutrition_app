import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

BarTouchData barTouchData(Color color) => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            '${rod.toY.toStringAsFixed(2)} kg',
            TextStyle(
              color: color,
              fontSize: 10,
            ),
          );
        },
      ),
    );
