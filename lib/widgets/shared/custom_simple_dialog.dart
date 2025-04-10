
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_logrant/widgets/shared/custom_button.dart';
import 'package:test_logrant/widgets/shared/custom_simple_text.dart';

class CustomSimpleDialog {

  static void alert(String title, String subtitle, {bool dismissible = false, Function? function}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CSimpleTxt(
              fTxt: title,
              fSize: 17.0,
              fColor: Colors.orange,
            ),
            const SizedBox(height: 20.0),
            CSimpleTxt(
              fTxt: subtitle,
              fSize: 16.0,
              fAlign: TextAlign.center,
              fColor: Colors.orange,
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              textButton: 'Aceptar',
              colorButton: Colors.red,
              onClick: () {
                print('buton pressed');
              },
            )
          ]
        )
      ),
      barrierDismissible: dismissible
    );
  }

}