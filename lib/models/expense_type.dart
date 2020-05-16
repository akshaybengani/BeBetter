import 'package:flutter/material.dart';

enum ExpenseType { expense, income, transfer }

extension ParseToString on ExpenseType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

ExpenseType stringToExpenseType(String type) {
  return ExpenseType.values
      .firstWhere((e) => e.toString() == 'ExpenseType.' + type);
}

Color expenseTypeToColor(ExpenseType expenseType) {
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

ExpenseType expenseTypeFromIndex(int index) {
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

List<bool> isSelectedEnum(ExpenseType expenseType) {
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
