import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.function,
    required this.string,
    required this.icon,
  });

  final void Function() function;
  final String string;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      minWidth: double.infinity,
      height: 45.0,
      color: AppColors.mainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            string,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Icon(
            icon,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
