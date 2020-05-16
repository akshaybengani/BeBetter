import 'package:bebetter/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseTypeToggleButton extends StatelessWidget {
  
  final ExpenseType expenseType;
  final Function(ExpenseType) onToggleChange;

  ExpenseTypeToggleButton({this.expenseType, this.onToggleChange});

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Expense".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Income".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Transfer".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      onPressed: (int index){
        onToggleChange(Expense.expenseTypeFromIndex(index));
      },
      isSelected: Expense.isSelectedEnum(expenseType),
      disabledColor: Colors.white,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Expense.expenseTypeToColor(expenseType),
      borderColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      disabledBorderColor: Colors.black,
    );
  }
}
