
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:test_logrant/controllers/people_controller.dart';

class PeopleList extends StatelessWidget {

  final bool isViewList;

  const PeopleList({
    super.key,
    this.isViewList = false
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeopleController>(
      id: 'people_list',
      builder: (gx) {
        return ListView.builder(
            itemCount: (isViewList)
            ? gx.favoritePersonList.length
            : gx.peopleList.length,
            itemBuilder: (context, index) {
              return FadeInLeft(
                delay: Duration(milliseconds: index * 50),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        (isViewList)
                        ? gx.favoritePersonList[index].avatar
                        : gx.peopleList[index].avatar
                      ),
                  ),
                  title: Text(
                    (isViewList)
                    ? gx.favoritePersonList[index].firstName
                    : gx.peopleList[index].firstName
                  ),
                  subtitle: Text(
                    (isViewList)
                    ? gx.favoritePersonList[index].email
                    : gx.peopleList[index].email
                  ),
                  trailing: (isViewList)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Checkbox(
                    value: gx.peopleList[index].isSelected,
                    onChanged: (value) => gx.onSelectedPerson(
                      value,
                      index
                    )
                  )
                )
              );
            }
        );
      }
    );
  }
}