

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class MyUtils {

  // ============================================
  /// DEVUELVE PORCIENTO DE ANCHO DE LA PANTALLA
  // ============================================
  static double porcientoW(double valor) {
    final size = MediaQuery.of(Get.context!).size;
    return ((size.width/100) * valor);
  }

  // ============================================
  /// DEVUELVE PORCIENTO DE ANCHO DE LA PANTALLA
  // ============================================
  static double porcientoH(double valor) {
    final size = MediaQuery.of(Get.context!).size;
    return ((size.height/100) * valor);
  }

  //==========================================================
  /// DEVUELVE COLOR EN HEXADECIMAL
  //==========================================================
  static Color hexToColor(String codeColor) {
    return Color(int.parse(codeColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  //==========================================================
  /// VERIFICA SI EL EMAIL ES VALIDO
  //==========================================================
  static bool validarEmail(String email) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());
    return (regExp.hasMatch(email)) ? true : false;
  }

  //==========================================================
  /// INFO MESSAGE
  //==========================================================
  static void msginfo(String msg) => log('✅ $msg ✅');

  //==========================================================
  /// WARNING MESSAGE
  //==========================================================
  static void msgwarn(String msg) => log('🚧 $msg 🚧');

  //==========================================================
  /// ERROR MESSAGE
  //==========================================================
  static void msgerror(String msg) => log('🛑 $msg 🛑');

  //==========================================================
  /// CONVIERTE LA FECHA DE TIMESTAMP A DATETIME (STRING)
  //==========================================================
  static String timeStampToDate(int timeStamp) {
    List<String> month = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"];
    // '30 de julio de 2022 - 10:25 am',
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return "${date.day} de ${month[date.month-1]} de ${date.year} - ${date.hour}:${date.minute} hrs.";
  }

  static List<TextInputFormatter> formatOnlyNumbers() => [
    FilteringTextInputFormatter.digitsOnly
  ];

  static List<TextInputFormatter> formatOnlyLetters() => [
    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]"))
  ];

}