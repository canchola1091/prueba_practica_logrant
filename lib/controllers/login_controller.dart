
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:test_logrant/data/global_preferences.dart';
import 'package:test_logrant/services/login_services.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/widgets/shared/custom_simple_dialog.dart';

class LoginController  extends GetxController{

  late GlobalPreferences globalPrefs;
  bool isLogin = true;
  bool showPasswordLogin = false;
  bool showPasswordRegister = false;
  bool isLoading = false;

  //? CONTROLLERS LOGIN
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  //? CONTROLLERS REGISTRO
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailRegCtrl = TextEditingController();
  final TextEditingController passwordRegCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    globalPrefs = GlobalPreferences();
  }

  void chanceViewLoginRegister() {
    isLogin = !isLogin;
    if(isLogin) {
      emailCtrl.clear();
      passwordCtrl.clear();
    } else {
      nameCtrl.clear();
      emailRegCtrl.clear();
      passwordRegCtrl.clear();
      phoneCtrl.clear();
    }
    update(['login_view']);
  }

  void changeViewPasswordLogin() {
    showPasswordLogin = !showPasswordLogin;
    update(['login_form']);
  }

  void changeViewPasswordRegister() {
    showPasswordRegister = !showPasswordRegister;
    update(['register_form']);
  }

  void _consumeLoginService() async {
    log('CONSUMO SERVICIO LOGIN');
    isLoading = true;
    update(['login_view']);
    Map<String, dynamic> resposnseLogin = await LoginServices.loginService(
      emailCtrl.text.trim(),
      passwordCtrl.text.trim()
    );
    log('RESPUESTA LOGIN: $resposnseLogin');
    
    if(resposnseLogin["success"]) {
      isLoading = false;
      update(['login_view']);
      _gotoPeopleView();
    } else {
      isLoading = false;
      update(['login_view']);
      CustomSimpleDialog.alert(
        'Ocurrio un error',
        resposnseLogin['message'],
        isLogin: true
      );
    }
  }

  void _consumeRegisterService() async {
    log('CONSUMO SERVICIO REGISTRO');
    isLoading = true;
    update(['login_view']);
    Map<String, dynamic> resposnseRegister = await LoginServices.registerService(
      emailRegCtrl.text.trim(),
      passwordRegCtrl.text.trim()
    );
    log('RESPUESTA REGISTRO: $resposnseRegister');
    
    if(resposnseRegister["success"]) {
      isLoading = false;
      update(['login_view']);
      CustomSimpleDialog.alert(
        'Exito',
        '${resposnseRegister['message']}\nInicia sesión por favor',
        isLogin: false,
        onAccept: () {
          globalPrefs.setNameUser = nameCtrl.text.trim();
          globalPrefs.setPhoneUser = phoneCtrl.text.trim();
          isLogin = true;
          Get.back();
          MyUtils.msginfo('Nombre usuario: ${globalPrefs.nameUser}');
          MyUtils.msginfo('Telefono usuario: ${globalPrefs.phoneUser}');
          update(['login_view']);
        }
      );
    } else {
      isLoading = false;
      update(['login_view']);
      CustomSimpleDialog.alert(
        'Ocurrio un error',
        resposnseRegister['message'],
        isLogin: false
      );
    }
  }

  void validateForm() {
    if(isLogin) {
      if(loginKey.currentState!.validate()) {
        log('LOGIN VALIDO');
        _consumeLoginService();
      } else {
        log('LOGIN NO VALIDO');
      }
    } else {
      if(registerKey.currentState!.validate()) {
        log('REGISTRO VALIDO');
        _consumeRegisterService();
      } else {
        log('REGISTRO NO VALIDO');
      }
    }
  }

  void _gotoPeopleView() {
    Get.offAllNamed('/people_view');
  }


}