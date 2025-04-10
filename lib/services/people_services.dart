
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_logrant/utils/my_utils.dart';

class PeopleServices {

  static Future<Map<String, dynamic>> serviceGetProducts() async {

    var url = Uri.parse('https://reqres.in/api/users?page=1');

    Map<String, dynamic> mapResponse =  {};
    MyUtils.msginfo('---> URL: $url');
    MyUtils.msginfo('Obteniendo categorías y productos...');

    try {
      var response = await http.get( url);
      log('Response status: ${response.statusCode}');
      log('Response status: ${response.body}');
      mapResponse["statusCode"] = response.statusCode;

      if(response.statusCode != 200) {
        MyUtils.msgerror('Error al obtener categorías y productos');
        mapResponse["success"] = false;
        return mapResponse;
      }

      mapResponse["success"] = true;
      mapResponse["body"] = response.body;
      return mapResponse;
    } catch (e) {
      MyUtils.msgerror('CATCH $e');
      mapResponse["success"] = false;
      return mapResponse;
    }
  }

}