import 'package:cecasem_nutricion_app/app/data/repositories_impl/authentication_reposiroty_impl.dart';
import 'package:cecasem_nutricion_app/app/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

Future<void> injectDependencies() async {
  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
}
