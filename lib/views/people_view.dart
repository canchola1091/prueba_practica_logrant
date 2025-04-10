
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:test_logrant/controllers/people_controller.dart';

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
          ),
          body: (gx.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: gx.peopleList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(gx.peopleList[index].avatar),
                  ),
                  title: Text(gx.peopleList[index].firstName),
                  subtitle: Text(gx.peopleList[index].email),
                  trailing: Checkbox(
                    value: gx.peopleList[index].isSelected,
                    onChanged: (value) => gx.onSelectedPrson(
                      value,
                      index
                    )
                  )
                );
              }
          )
        );
      }
    );
  }
}