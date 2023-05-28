import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../controller/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(homeProvider);
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Cecasem'),
                    MaterialButton(
                      color: AppColors.mainColor,
                      onPressed: () {
                        controller.logOut(context);
                      },
                      child: Icon(
                        Icons.logout,
                        color: AppColors.white,
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
