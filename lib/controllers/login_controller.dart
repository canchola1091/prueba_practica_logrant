
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController  extends GetxController{

  bool isLogin = true;
  bool showPasswordLogin = false;
  bool showPasswordRegister = false;

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

  void validateLoginForm() {
    if(loginKey.currentState!.validate()) {
      log('VALIDO');
    } else {
      log('NO VALIDO');
    }
  }


}