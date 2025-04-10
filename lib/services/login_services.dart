
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
    } catch (e) {
      resultLogin['success'] = false;
      resultLogin['message'] = 'Error al iniciar sesión.';
      MyUtils.msgerror("Error: $e");
    }
    return resultLogin;
  }

  static Future<Map<String, dynamic>> registerService(String email, String password) async {
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
      MyUtils.msginfo("Result: $resultRegister");
    } catch (e) {
      resultRegister['success'] = false;
      resultRegister['message'] = 'Error al realizar registro.';
      MyUtils.msgerror("Result: $resultRegister");
      MyUtils.msgerror("Error: $e");
    }
    return resultRegister;
  }

}