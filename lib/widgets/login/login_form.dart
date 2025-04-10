
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:test_logrant/controllers/login_controller.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/validations/validations.dart';
import 'package:test_logrant/widgets/shared/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'login_form',
      builder: (gx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: gx.loginKey,
            child: Column(
              children: [
                CustomTextFormField(
                  ctrl:  gx.emailCtrl,
                  label: 'Correo Electrónico',
                  isLogin: true,
                  inputType: TextInputType.emailAddress,
                  validation: (value) => Validations.validEmail(value!),
                ),
                SizedBox(height: MyUtils.porcientoH(3.0)),
                CustomTextFormField(
                  ctrl:  gx.passwordCtrl,
                  label: 'Contraseña',
                  isLogin: true,
                  isPassword: !gx.showPasswordLogin,
                  validation: (value) => Validations.validRequiredAndLength(value!, 8),
                  iconSuffix: IconButton(
                    onPressed: () => gx.changeViewPasswordLogin(),
                    icon: Icon(
                      (!gx.showPasswordLogin)
                      ? Icons.visibility
                      : Icons.visibility_off,
                      color: Colors.teal,
                    )
                  )
                )
              ]
            )
          )
        );
      }
    );
  }
}