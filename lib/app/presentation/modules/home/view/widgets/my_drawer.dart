import 'package:cecasem_nutricion_app/app/presentation/modules/home/controller/home_controller.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:cecasem_nutricion_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            MaterialButton(
              color: AppColors.white,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () {
                controller.logOut(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${AppConstants.logout}  ',
                    style: TextStyle(color: AppColors.red),
                  ),
                  Icon(
                    Icons.logout,
                    color: AppColors.red,
                    size: 16.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
