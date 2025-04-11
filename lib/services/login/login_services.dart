
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_logrant/utils/my_utils.dart';

class LoginServices {

  static Future<Map<String, dynamic>> loginService(String email, String password) async {
    Map<String, dynamic> resultLogin = {
      'success': false,
      'message': '',
    };
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

    // Obtener los datos desde Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        resultLogin['body'] = userData;
      }

      resultLogin['success'] = true;
      resultLogin['message'] = 'Usuario logueado correctamente.';
    } catch (e) {
      resultLogin['success'] = false;
      resultLogin['message'] = 'Error al iniciar sesión.';
      MyUtils.msgerror("Error: $e");
    }
    return resultLogin;
  }

  static Future<Map<String, dynamic>> registerService({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    Map<String, dynamic> resultRegister = {
      'success': false,
      'message': '',
    };
    try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Obtener el UID del nuevo usuario
      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'phone': phone,
        'email': email,
        'createdAt': DateTime.now().toString(),
      });

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