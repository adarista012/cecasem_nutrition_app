import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../controller/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(homeProvider);
            return Text("${controller.counter}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeProvider.read.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
  