
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/login_controller.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/widgets/login/login_form.dart';
import 'package:test_logrant/widgets/register/register_form.dart';
import 'package:test_logrant/widgets/shared/custom_button.dart';
import 'package:test_logrant/widgets/shared/custom_simple_text.dart';

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
                  SizedBox(height: MyUtils.porcientoH(5.0)),
                  (gx.isLogin)
                  ? const LoginForm()
                  : const RegisterForm(),

                  SizedBox(height: MyUtils.porcientoH(5.0)),

                  CustomButton(
                    widthButton: MyUtils.porcientoW(15.0),
                    textButton: (gx.isLogin) ? 'Iniciar sesión' : 'Registrarse',
                    colorButton: (gx.isLogin) ? Colors.teal : Colors.purple,
                    onClick: () {
                      print('Iniciar sesión');
                    }
                  ),

                  SizedBox(height: MyUtils.porcientoH(12.0)),

                  (gx.isLogin)
                  ? _registerTextButton(gx.chanceViewLoginRegister)
                  : _loginTextButton(gx.chanceViewLoginRegister),

                ]
              )
            )
          )
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
        child: CSimpleTxt(
          fTxt: label,
          fSize: 24.0,
          fColor: Colors.white,
        )
      )
    );
  }
  
  Widget _registerTextButton( void Function() onClick ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CSimpleTxt(
          fTxt: '¿Aún no tienes cuenta?',
          fSize: 15.0,
        ),
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
        CSimpleTxt(
          fTxt: '¿Ya tienes cuenta?',
          fSize: 15.0,
        ),
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