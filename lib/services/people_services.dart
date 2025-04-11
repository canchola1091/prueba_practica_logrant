
import 'package:http/http.dart' as http;
import 'package:test_logrant/utils/my_utils.dart';

class PeopleServices {

  static Future<Map<String, dynamic>> serviceGetPeople() async {

    var url = Uri.parse('https://reqres.in/api/users?page=1&per_page=12');

    Map<String, dynamic> mapResponse =  {};
    MyUtils.msginfo('---> URL: $url');
    MyUtils.msginfo('Obteniendo personas...');

    try {
      var response = await http.get( url);

      if(response.statusCode != 200) {
        MyUtils.msgerror('Error al obtener personas');
        mapResponse["success"] = false;
        return mapResponse;
      }

      
      mapResponse["statusCode"] = response.statusCode;
      mapResponse["success"] = true;
      // Map<String, dynamic> decodeResponse =  jsonDecode(response.body);
      // mapResponse["data"] = decodeResponse["data"];
      mapResponse["body"] = response.body;
      // log('MAPRESPONSE: $mapResponse');
      return mapResponse;
    } catch (e) {
      MyUtils.msgerror('CATCH $e');
      mapResponse["success"] = false;
      return mapResponse;
    }
  }

}