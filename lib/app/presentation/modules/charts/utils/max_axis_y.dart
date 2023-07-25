import 'package:fl_chart/fl_chart.dart';

double maxAxisY(
  Map<int, double> map,
  Map<int, double> sMap,
) {
  double max =
      map.values.reduce((value, element) => value > element ? value : element);
  double sMax =
      sMap.values.reduce((value, element) => value > element ? value : element);
  return max > sMax ? max : sMax;
}

List<FlSpot> getSpots(Map<int, double> mapN) {
  List<FlSpot> list = mapN.keys
      .map((e) => FlSpot(double.parse(e.toString()), mapN[e]!))
      .toList();
  return list;
}
