
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/people_controller.dart';
import 'package:test_logrant/widgets/people/people_list.dart';
import 'package:test_logrant/widgets/shared/custom_simple_text.dart';

class FavoritePersonView extends StatelessWidget {
  const FavoritePersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeopleController>(
      builder: (gx) {
        return Scaffold(
          appBar: AppBar(
            title: const CSimpleTxt(
              fTxt: 'Personas favoritas',
              fSize: 20.0,
              fColor: Colors.white,
            ),
            backgroundColor: Colors.teal,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)
            ),
          ),
          body: const PeopleList(isViewList: true)
        );
      }
    );
  }
}