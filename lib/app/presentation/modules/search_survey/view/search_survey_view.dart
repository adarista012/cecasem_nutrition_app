import 'package:cecasem_nutricion_app/app/presentation/global/widgets/my_appbar.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/add_survey/view/widgets/my_text_flied.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_controller.dart';
import 'package:cecasem_nutricion_app/app/presentation/modules/search_survey/controller/search_survey_provider.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class SearchSurveyView extends StatelessWidget {
  const SearchSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: myAppBar(AppConstants.searcher),
      body: Consumer(
        builder: (_, ref, widget) {
          final __ = ref.watch(searchSurveyProvider);

          return Column(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchTextField(
                    controller: __,
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: __.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : __.listSearcheable.isEmpty
                          ? Center(
                              child: Text(
                                'Ingrese algún nombre',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: __.listSearcheable.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    child: ListTile(
                                      title: Text(
                                        __.listSearcheable[index],
                                        style: TextStyle(
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: AppColors.blue,
                                      ),
                                      // TargetPlatform.iOS
                                      // defaultTargetPlatform.,
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final SearchSurveyController controller;
  const SearchTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: controller.textOnChange,
      controller: controller.queryTextEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorText: null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: 'Ingrese el nombre a ${AppConstants.search.toLowerCase()}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
