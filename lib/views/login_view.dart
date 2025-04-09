
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_logrant/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: 'login',
      builder: (gx) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                header(
                  (gx.isLogin) ? 'Inicio de sesión' : 'Registro',
                  gx.isLogin
                ),
                SizedBox(height: 20),
                (gx.isLogin)
                ? _loginForm()
                : _registerForm(),
                SizedBox(height: 20),
                _buildRegisterButton(gx.chanceViewLoginRegister),
              ],
            )
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
          ),
        ),
      ),
    );
  }
  
  Widget _loginForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _registerForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Teléfono'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          )
        ]
      )
    );
  }

  Widget _buildRegisterButton( void Function() onClick ) {
    return Row(
      children: [
        Text('¿No tienes cuenta?'),
        TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              decoration: TextDecoration.underline
            )
          ),
          child: Text('Regístrate'),
        )
      ]
    );
  }

}