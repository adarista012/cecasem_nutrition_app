import 'package:cecasem_nutricion_app/app/presentation/global/widgets/my_appbar.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_provider.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/utils/search_textfield.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/view/widgets/card_list_search.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class SearchSurveyView extends StatelessWidget {
  const SearchSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: myAppBar(AppConstants.searcher),
        body: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(searchSurveyProvider);
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SearchTextField(
                    controller: controller,
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListSearch(controller: controller),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ListSearch extends StatelessWidget {
  final SearchSurveyController controller;
  const ListSearch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : controller.listSearcheable.isEmpty
            ? Center(
                child: Text(
                  AppConstants.searcherLabel,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: controller.listSearcheable.length,
                itemBuilder: (context, index) {
                  return CardListSearch(controller: controller, index: index);
                },
              );
  }
}
