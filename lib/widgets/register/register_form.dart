
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/login/login_controller.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/validations/validations.dart';
import 'package:test_logrant/widgets/shared/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'register_form',
      builder: (gx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: gx.registerKey,
            child: Column(
              children: [
                CustomTextFormField(
                  ctrl:  gx.nameCtrl,
                  label: 'Nombre',
                  isLogin: false,
                  capitalization: TextCapitalization.words,
                  validation: (value) => Validations.validNames(value!),
                ),
                SizedBox(height: MyUtils.porcientoH(3.0)),
                CustomTextFormField(
                  ctrl:  gx.phoneCtrl,
                  label: 'Teléfono',
                  isLogin: false,
                  maxCaracters: 10,
                  onlyNumbers: true,
                  inputType: TextInputType.phone,
                  validation: (value) => Validations.validRequiredAndLength(value!, 10),
                ),
                SizedBox(height: MyUtils.porcientoH(3.0)),
                CustomTextFormField(
                  ctrl:  gx.emailRegCtrl,
                  label: 'Correo electrónico',
                  isLogin: false,
                  inputType: TextInputType.emailAddress,
                  validation: (value) => Validations.validEmail(value!),
                ),
                SizedBox(height: MyUtils.porcientoH(3.0)),
                CustomTextFormField(
                  ctrl:  gx.passwordRegCtrl,
                  label: 'Contraseña',
                  isLogin: false,
                  isPassword: !gx.showPasswordRegister,
                  validation: (value) => Validations.validRequiredAndLength(value!, 8),
                  iconSuffix: IconButton(
                    onPressed: () => gx.changeViewPasswordRegister(),
                    icon: Icon(
                      (!gx.showPasswordRegister)
                      ? Icons.visibility
                      : Icons.visibility_off,
                      color: Colors.purple,
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