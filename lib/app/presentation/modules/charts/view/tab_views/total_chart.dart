import 'package:cecasem_nutricion_app/app/presentation/modules/charts/controller/charts_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalChart extends StatelessWidget {
  final ChartsController controller;
  const TotalChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Text(
                  '${AppConstants.titleTotal} por edades',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        '${AppConstants.comunity}  ',
                        style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.blue,
                              ),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: DropdownButton(
                            value: controller.comunity,
                            padding: const EdgeInsets.all(8.0),
                            elevation: 16,
                            underline: Container(
                              color: AppColors.transparent,
                            ),
                            items: controller.listOfComunitys!
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.changeComunity(value!);
                              controller.switchChart(
                                AppConstants.titleTotal,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: !controller.isLoading
                  ? controller.totalChart == null ||
                          controller.totalChart!.isEmpty
                      ? Text(
                          'Seleccionar ${AppConstants.comunity}',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 32,
                              height: MediaQuery.of(context).size.width - 32,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.grey,
                                  width: 0.8,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.6),
                                    blurRadius: 2.4,
                                    spreadRadius: 0.8,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: PieChart(
                                      PieChartData(
                                        sectionsSpace: 3.2,
                                        centerSpaceRadius: 0,
                                        sections: showingSections(
                                          controller.totalChart!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          ' 0-2 años',
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: AppColors.amber,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          ' 3-5 años',
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          ' 6-8 años',
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: AppColors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            ' 9-10 años',
                                            style: TextStyle(
                                              color: AppColors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: AppColors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Text(
                                            ' 11-12 años',
                                            style: TextStyle(
                                              color: AppColors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

List<PieChartSectionData> showingSections(List<dynamic> list) {
  return List.generate(5, (i) {
    const fontSize = 16.0;
    const radius = 160.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: AppColors.mainColor,
          value: double.parse(list[0].toString()),
          title: '${list[0]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 1:
        return PieChartSectionData(
          color: AppColors.amber,
          value: double.parse(list[1].toString()),
          title: '${list[1]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 2:
        return PieChartSectionData(
          color: AppColors.grey,
          value: double.parse(list[2].toString()),
          title: '${list[2]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 3:
        return PieChartSectionData(
          color: AppColors.red,
          value: double.parse(list[3].toString()),
          title: '${list[3]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      case 4:
        return PieChartSectionData(
          color: AppColors.blue,
          value: double.parse(list[4].toString()),
          title: '${list[4]}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
          titlePositionPercentageOffset: 0.8,
        );
      default:
        throw Exception('Error de porcentajes');
    }
  });
}
