
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:test_logrant/data/global_preferences.dart';
import 'package:test_logrant/models/people_model.dart';
import 'package:test_logrant/services/people_services.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/widgets/shared/custom_simple_dialog.dart';

class PeopleController extends GetxController{

  late GlobalPreferences globalPrefs;
  late String nameUser;
  late String phoneUser;
  bool isLoading = true;
  late PeopleModel peopleModel;
  List<Person> peopleList = [];
  List<Person> favoritePersonList = [];

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

  void onSelectedPerson(bool? value, index) {
    peopleList[index].isSelected = value!;
    MyUtils.msginfo('NAME: ${peopleList[index].firstName}');
    MyUtils.msginfo('NAME: ${peopleList[index].isSelected}');
    if(peopleList[index].isSelected) {
      favoritePersonList.add(peopleList[index]);
      MyUtils.msginfo('FAVORITE: ${favoritePersonList.length}');
    }else {
      favoritePersonList.remove(peopleList[index]);
      MyUtils.msginfo('FAVORITE: ${favoritePersonList.length}');
    }

    update(['people_view','people_list']);
  }

  void showDialogLogOut(BuildContext context) {
    CustomSimpleDialog.alert(
      'Alerta',
      '¿Quieres cerrar sesión?',
      isLogin: true,
      onAccept: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          'login_view',
          (route) => false,
        );
      }
    );
  }

  void consumeGetPeople({bool retry = false})async{

    if(retry) {
      isLoading = true;
      update(['people_view']);
    }

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
      CustomSimpleDialog.alert(
        'Upss!',
        'Ocurrio un error al obtener las personas',
        isLogin: true,
        onAccept: () => Get.back()
      );
    }
    // MyUtils.msginfo(mapResponse.toString());
  }

  void goToFavoriteView(BuildContext context) => Navigator.pushNamed(
    context,
    '/favorite_person_view'
  );

  void goToProfileView(BuildContext context) => Navigator.pushNamed(
    context,
    '/profile_view'
  );


}