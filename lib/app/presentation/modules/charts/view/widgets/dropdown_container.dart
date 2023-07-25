import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget dropdownContainer(
  List<String>? list,
  void Function(String?)? onChanged,
  String? value,
) {
  return Expanded(
    child: Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.blue,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: DropdownButton(
        value: value,
        padding: const EdgeInsets.all(8.0),
        elevation: 16,
        underline: Container(
          color: AppColors.transparent,
        ),
        items: list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
