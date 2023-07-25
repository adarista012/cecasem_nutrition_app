import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/get_titles_diagnosis.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/charts/view/widgets/fl_charts/trasparent_title.dart';
import 'package:fl_chart/fl_chart.dart';

FlTitlesData get titlesDataDiagnosis => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitlesDiagnosis,
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
