import 'package:bebetter/models/expense_type.dart';
import 'package:flutter/material.dart';

class ExpenseTypeToggleButton extends StatelessWidget {
  
  final ExpenseType expenseType;
  final Function(ExpenseType) onToggleChange;

  ExpenseTypeToggleButton({this.expenseType, this.onToggleChange});

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: BoxConstraints(maxHeight: 40),
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
        onToggleChange(expenseTypeFromIndex(index));
      },
      isSelected: isSelectedEnum(expenseType),
      disabledColor: Colors.white,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: expenseTypeToColor(expenseType),
      borderColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      disabledBorderColor: Colors.black,
    );
  }
}
