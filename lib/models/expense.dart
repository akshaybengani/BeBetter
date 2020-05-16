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

  ExpenseType stringToExpenseType(String type) {
    return ExpenseType.values
        .firstWhere((e) => e.toString() == 'ExpenseType.' + type);
  }

  static Color expenseTypeToColor(ExpenseType expenseType) {
    switch (expenseType) {
      case ExpenseType.expense:
        return Colors.red;
      case ExpenseType.income:
        return Colors.green;
      case ExpenseType.transfer:
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  static ExpenseType expenseTypeFromIndex(int index){
     switch (index) {
      case 0:
        return ExpenseType.expense;
      case 1:
        return ExpenseType.income;
      case 2:
        return ExpenseType.transfer;
      default:
        return ExpenseType.expense;
    }
  }

  static List<bool> isSelectedEnum(ExpenseType expenseType) {
    switch (expenseType) {
      case ExpenseType.expense:
        return [true, false, false];
      case ExpenseType.income:
        return [false, true, false];
      case ExpenseType.transfer:
        return [false, false, true];
      default:
        return [true, false, false];
    }
  }
}

enum ExpenseType { expense, income, transfer }

extension ParseToString on ExpenseType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
