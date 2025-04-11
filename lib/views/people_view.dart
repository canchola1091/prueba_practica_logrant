
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/people_controller.dart';
import 'package:test_logrant/widgets/people/people_list.dart';

class PeopleView extends StatelessWidget {
  const PeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeopleController>(
      init: PeopleController(),
      id: 'people_view',
      builder: (gx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: () => gx.consumeGetPeople(retry: true)
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () => gx.showDialogLogOut(context)
              )
            ]
          ),

          floatingActionButton: (gx.favoritePersonList.isNotEmpty)
            ? FloatingActionButton(
                onPressed: () => gx.goToFavoriteView(context),
                backgroundColor: Colors.teal,
                child: const Icon(Icons.favorite, size: 30)
              )
            : null,

          body: (gx.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : const PeopleList()
        );
      }
    );
  }
}