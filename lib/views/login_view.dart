
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/login_controller.dart';
import 'package:test_logrant/widgets/login/login_form.dart';
import 'package:test_logrant/widgets/register/register_form.dart';

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: 'login_view',
      builder: (gx) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  header(
                    (gx.isLogin) ? 'Inicio de sesión' : 'Registro',
                    gx.isLogin
                  ),
                  SizedBox(height: 20.0),
                  (gx.isLogin)
                  ? const LoginForm()
                  : const RegisterForm(),
                  SizedBox(height: 20),
                  (gx.isLogin)
                  ? _registerTextButton(gx.chanceViewLoginRegister)
                  : _loginTextButton(gx.chanceViewLoginRegister),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget header(String label, bool isLogin) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: (isLogin) ? Colors.teal : Colors.purple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          )
        )
      )
    );
  }
  
  Widget _registerTextButton( void Function() onClick ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿Aún no tienes cuenta?'),
        TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            textStyle: TextStyle(
              decoration: TextDecoration.underline
            )
          ),
          child: Text('Regístrate'),
        )
      ]
    );
  }


  Widget _loginTextButton( void Function() onClick ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿Ya tienes cuenta?'),
        TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            foregroundColor: Colors.purple,
            textStyle: TextStyle(
              decoration: TextDecoration.underline,
            )
          ),
          child: Text('Inicia sesión'),
        )
      ]
    );
  }

}