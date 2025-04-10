
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController ctrl;
  final String? Function(String?)? validation;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final String label;
  final bool isPassword;
  final bool isLogin;
  final Widget? iconSuffix;
  
  const CustomTextFormField({
    super.key,
    required this.ctrl,
    required this.label,
    required this.validation,
    this.inputType = TextInputType.text,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isLogin = false,
    this.iconSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      keyboardType: inputType,
      validator: validation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: (isLogin) ? Colors.teal : Colors.purple),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: (isLogin) ? Colors.teal : Colors.purple),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: (isLogin) ? Colors.teal : Colors.purple, width: 2),
        ),
        suffixIcon: iconSuffix,
      ),
    );
  }
}