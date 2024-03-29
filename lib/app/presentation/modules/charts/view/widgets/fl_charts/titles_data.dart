import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/trasparent_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/bottom_titles.dart';

FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: bottomTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: transparentTitles,
          reservedSize: 16.0,
        ),
      ),
    );
