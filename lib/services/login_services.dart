
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_logrant/utils/my_utils.dart';

class LoginServices {

  static Future<Map<String, dynamic>> loginService(String email, String password) async {
    Map<String, dynamic> resultLogin = {
      'success': false,
      'message': '',
    };
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      resultLogin['success'] = true;
      resultLogin['message'] = 'Usuario logueado correctamente.';
      MyUtils.msgerror("Result: $resultLogin");
    } catch (e) {
      resultLogin['success'] = false;
      resultLogin['message'] = 'Error al iniciar sesión.';
      MyUtils.msgerror("Result: $resultLogin");
      MyUtils.msgerror("Error: $e");
    }
    return resultLogin;
  }

  Future<Map<String, dynamic>> registerServices(String email, String password) async {
    Map<String, dynamic> resultRegister = {
      'success': false,
      'message': '',
    };
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      resultRegister['success'] = true;
      resultRegister['message'] = 'Usuario registrado correctamente.';
      MyUtils.msgerror("Result: $resultRegister");
    } catch (e) {
      resultRegister['success'] = false;
      resultRegister['message'] = 'Error al realizar registro.';
      MyUtils.msgerror("Result: $resultRegister");
      MyUtils.msgerror("Error: $e");
    }
    return resultRegister;
  }

}