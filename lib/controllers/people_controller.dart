
import 'package:get/get.dart';

import 'package:test_logrant/data/global_preferences.dart';
import 'package:test_logrant/models/people_model.dart';
import 'package:test_logrant/services/people_services.dart';
import 'package:test_logrant/utils/my_utils.dart';

class PeopleController extends GetxController{

  late GlobalPreferences globalPrefs;
  late String nameUser;
  late String phoneUser;
  bool isLoading = true;
  late PeopleModel peopleModel;
  List<Person> peopleList = [];

  @override
  void onInit() {
    super.onInit();
    globalPrefs = GlobalPreferences();
    nameUser = globalPrefs.nameUser ?? '';
    phoneUser = globalPrefs.phoneUser ?? '';
    MyUtils.msginfo('NAMEUSER: $nameUser');
    MyUtils.msginfo('PHONEUSER: $phoneUser');
  }

  @override
  void onReady() {
    super.onReady();
    consumeGetPeople();
  }

  void onSelectedPrson(bool? value, index) {
    peopleList[index].isSelected = value!;
    MyUtils.msginfo('ID: ${peopleList[index].id}');
    MyUtils.msginfo('NAME: ${peopleList[index].firstName}');
    MyUtils.msginfo('EMAIL: ${peopleList[index].email}');
    MyUtils.msginfo('AVATAR: ${peopleList[index].avatar}');
    update(['people_view']);
  }

  void consumeGetPeople()async{
    Map<String, dynamic> mapResponse = await PeopleServices.serviceGetPeople();
    if(mapResponse["success"]) {
      // MyUtils.msginfo('--> BODY: ${mapResponse["body"]}');
      peopleModel = peopleModelFromJson(mapResponse["body"]);
      peopleList = peopleModel.data;
      MyUtils.msginfo('--> BODY: ${peopleList.length}');
      isLoading = false;
      update(['people_view']);
    }else {
      MyUtils.msgerror('Error al obtener personas');
      isLoading = false;
      update(['people_view']);
    }
    // MyUtils.msginfo(mapResponse.toString());
  }

}