
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController  extends GetxController{

  bool isLogin = true;

  //? CONTROLLERS LOGIN
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  //? CONTROLLERS REGISTRO
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailRegCtrl = TextEditingController();
  final TextEditingController passwordRegCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  void chanceViewLoginRegister() {
    isLogin = !isLogin;
    update(['login']);
  }


}