import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/utils/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await injectDependencies();

  runApp(
    const MyApp(),
  );
}
