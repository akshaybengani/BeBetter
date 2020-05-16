import 'package:flutter/material.dart';

class Expense {
  String id;
  DateTime createdAt;
  String name;
  double price;
  String category;
  String iconName;

  Expense.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    category = json["category"];
    iconName = json["icon_name"];

    if (json["created_at"] != null) {
      createdAt = DateTime.parse(json["created_at"]);
    }

    if (json["price"] != null) {
      price = double.parse(json["price"].toString());
    } else {
      price = 0;
    }
  }

  static List<Expense> listFromJson(List<dynamic> list) {
    List<Expense> rows = list.map((i) => Expense.fromJson(i)).toList();
    return rows;
  }
}

