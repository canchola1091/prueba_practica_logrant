// To parse this JSON data, do
//
//     final peopleModel = peopleModelFromJson(jsonString);

import 'dart:convert';

PeopleModel peopleModelFromJson(String str) => PeopleModel.fromJson(json.decode(str));

class PeopleModel {
    final int page;
    final int perPage;
    final int total;
    final int totalPages;
    final List<Person> data;
    final Support support;

    PeopleModel({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Person>.from(json["data"].map((x) => Person.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );
}

class Person {
    final int id;
    final String email;
    final String firstName;
    final String lastName;
    final String avatar;
    bool isSelected = false;

    Person({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
        this.isSelected = false,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );
}

class Support {
    final String url;
    final String text;

    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );
}
