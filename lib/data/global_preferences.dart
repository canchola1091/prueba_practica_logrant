
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

  /// LISTA DE FAVORITOS
  List<String>? get listFavoritos => globalPreferences.getStringList('listFavoritos');
  set setListFavoritos(List<String>? value) => globalPreferences.setStringList('listFavoritos', value ?? []);

}