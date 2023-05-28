import 'package:cecasem_nutricion_app/app/presentation/modules/login/controller/login_provider.dart';
import 'package:cecasem_nutricion_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(45.0),
                child: Image.asset('images/logo.png'),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      TextField(
                        onChanged: loginProvider.read.onEmailChanged,
                        decoration: InputDecoration(
                          errorText: loginProvider.read.emailError
                              ? 'El email es inválido'
                              : null,
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                                color: AppColors.mainColor, width: 8.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        onChanged: loginProvider.read.onPasswordChanged,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: loginProvider.read.passwordError
                              ? 'La contraseña debe tener más de cinco caracteres'
                              : null,
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Consumer(
                        builder: (_, ref, __) {
                          final controller = ref.watch(loginProvider);
                          return MaterialButton(
                            onPressed: () {
                              controller.sendRequest(_);
                            },
                            color: AppColors.mainColor,
                            minWidth: double.infinity,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Text(
                              'Ingresar',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20.0),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
