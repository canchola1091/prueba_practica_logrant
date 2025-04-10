
class Validations {

  static String? validNames(String value) {
    if (value.isEmpty) return 'Este campo es requerido.';
    if (!validateNames(value)) return 'Por favor, introduzca solo caracteres alfabéticos.';
    return null;
  }

  static String? validEmail(String value) {
    if(value.isEmpty) return 'Este campo es requerido.';
    if(!validarEmail(value)) return 'El email no es válido';
    return null;
  } 

  /// Validar si el campo es requerido (Acepta mínimo de caracteres)
  static String? validRequiredAndLength(String? value, [int? minLength]) {
    if (value == null || value.isEmpty) return 'Este campo es requerido.';
    if (minLength != null && value.length < minLength) return 'Minimo $minLength caracteres.';
    return null;
  }

}

//==========================================================
/// VALIDA QUE SOLO SE INGRESEN CARACTERES ALFANUMERICOS CON ESPACIO
//==========================================================
bool validateNames(String value){
  String  pattern = r'^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

//==========================================================
/// VERIFICA SI EL EMAIL ES VALIDO
//==========================================================
bool validarEmail(String email) {
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern.toString());
  return (regExp.hasMatch(email)) ? true : false;
}