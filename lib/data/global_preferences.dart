
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  
  static final GlobalPreferences _instancia = GlobalPreferences._internal(); 
  factory GlobalPreferences() {
    return _instancia;
  }
  GlobalPreferences._internal();
  late SharedPreferences globalPreferences;
  initVarsPermanentes() async {
    globalPreferences = await SharedPreferences.getInstance();
  }

  /// NOMBRE DE USUARIO
  String? get nameUser => globalPreferences.getString('nameUser');
  set setNameUser(String? value) => globalPreferences.setString('nameUser', value ?? '');

  /// TELEFONO DE USUARIO
  String? get phoneUser => globalPreferences.getString('phoneUser');
  set setPhoneUser(String? value) => globalPreferences.setString('phoneUser', value ?? '');

  /// CORREO DE USUARIO
  String? get emailUser => globalPreferences.getString('emailUser');
  set setEmailUser(String? value) => globalPreferences.setString('emailUser', value ?? '');

  /// FECHA DE REGISTRO
  String? get dateRegister => globalPreferences.getString('dateRegister');
  set setDateRegisterr(String? value) => globalPreferences.setString('dateRegister', value ?? '');

}