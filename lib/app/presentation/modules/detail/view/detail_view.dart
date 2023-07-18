import 'package:cecasem_nutricion_app/app/presentation/global/widgets/my_appbar.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/detail/controller/detail_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/detail/view/widgets/column_data.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final controller = ref.watch(detailProvider);

      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: myAppBar(AppConstants.detail),
        body: ColumnData(
          controller: controller,
        ),
      );
    });
  }
}
