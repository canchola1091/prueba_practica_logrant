
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:test_logrant/controllers/profile/profile_controller.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/widgets/shared/custom_simple_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (gx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: CSimpleTxt(
              fTxt: 'Datos de usuario',
              fSize: 20,
              fColor: Colors.white,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MyUtils.porcientoH(5)),
                itemDataUser(
                  'Nombre',
                  gx.nameUser,
                  Icons.person
                ),
                itemDataUser(
                  'Teléfono',
                  gx.phoneUser,
                  Icons.phone
                ),
                itemDataUser(
                  'Email',
                  gx.emailUser,
                  Icons.email
                ),
                itemDataUser(
                  'Fecha de registro',
                  gx.dateRegisterUser,
                  Icons.calendar_today
                ),
              ]
            ),
          )
        );
      }
    );
  }

  Widget itemDataUser(String title, String subtitle, IconData icon) {
    return FadeIn(
      child: ListTile(
        leading: Icon(icon, size: 25),
        title: CSimpleTxt(
          fTxt: title,
          fSize: 16.0,
          fColor: Colors.teal,
        ),
        subtitle: CSimpleTxt(
          fTxt: subtitle,
          fSize: 15,
        ),
      ),
    );
  }

}