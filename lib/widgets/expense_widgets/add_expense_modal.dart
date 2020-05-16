import 'dart:io';

import 'package:bebetter/models/expense_type.dart';
import 'package:bebetter/models/payment_type.dart';
import 'package:bebetter/models/quantity_type.dart';
import 'package:bebetter/widgets/expense_widgets/expensetype_toggle_button.dart';
import 'package:bebetter/widgets/expense_widgets/increment_decrement_textfield.dart';
import 'package:bebetter/widgets/expense_widgets/paymenttype_toggle_button.dart';
import 'package:bebetter/widgets/expense_widgets/quantitytype_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddExpenseModal extends StatefulWidget {
  @override
  _AddExpenseModalState createState() => _AddExpenseModalState();
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  // Expense name
  // Expense Amount
  // Expense Type Expense Income Transfer
  // Expense Icon
  // Expense Date and time
  // Expense Image
  // Expense Severity
  // Expense Location
  // Expense Description
  // Expense Category
  ExpenseType expenseType = ExpenseType.expense;
  PaymentType paymentType = PaymentType.upi;
  QuantityType quantityType = QuantityType.pack;
  TextEditingController nameController, amountController;
  FocusNode amountFocusNode = FocusNode();
  DateTime selectedDateAndTime;
  File selectedImage;
  int quantityCount = 0;

  @override
  void initState() {
    nameController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: expenseTypeToColor(expenseType),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: expenseTypeToColor(expenseType),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: 400 + MediaQuery.of(context).viewInsets.bottom,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ExpenseTypeToggleButton(
                    expenseType: expenseType,
                    onToggleChange: (ExpenseType et) {
                      setState(() {
                        expenseType = et;
                        print(et.toShortString());
                      });
                    },
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.calendarAlt),
                    onPressed: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000, 1),
                        lastDate: DateTime.now(),
                      ).then((date) async {
                        selectedDateAndTime = date;
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((time) {
                          selectedDateAndTime != null
                              ? selectedDateAndTime = DateTime(
                                  selectedDateAndTime.year,
                                  selectedDateAndTime.month,
                                  selectedDateAndTime.day,
                                  time.hour,
                                  time.minute,
                                )
                              : DateTime.now();
                          print(selectedDateAndTime);
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PaymentTypeToggleButton(
                  paymentType: paymentType,
                  onToggleChange: (PaymentType pt) {
                    setState(() {
                      paymentType = pt;
                      print(pt.toShortString());
                    });
                  },
                ),
                QuantityTypeToggleButton(
                  quantityType: quantityType,
                  onToggleChange: (QuantityType qt) {
                    setState(() {
                      quantityType = qt;
                      print(qt.toShortString());
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 5),
            Row(children: <Widget>[
             Expanded(child: SizedBox()), 
              IncrementDecrementTextField(
                  count: quantityCount,
                  color: quantityTypeToColor(quantityType),
                  onCountChange: (int change) {
                    setState(() {
                      quantityCount += change;
                    });
                  },
                ),
                SizedBox(width: 10),
            ],),
            SizedBox(height: 10),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: nameController,
              autofocus: false,
              onSubmitted: (_) {
                amountFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Name",
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: amountController,
                    focusNode: amountFocusNode,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Amount",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: expenseTypeToColor(expenseType), width: 2),
                  ),
                  width: 80,
                  height: 70,
                  child: Material(
                    child: InkWell(
                      onTap: () async {
                        await ImagePicker.pickImage(
                          source: ImageSource.gallery,
                        ).then((imageFile) {
                          setState(() {
                            selectedImage = imageFile;
                          });
                        });
                      },
                      child: selectedImage == null
                          ? Icon(
                              Icons.photo_library,
                              color: expenseTypeToColor(expenseType),
                              size: 40,
                            )
                          : Image.file(selectedImage),
                    ),
                  ),
                )
              ],
            ),
            FlatButton.icon(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              icon: Icon(FontAwesomeIcons.wallet, color: Colors.white),
              color: expenseTypeToColor(expenseType),
              label: Text(
                "\tAdd ".toUpperCase() +
                    expenseType.toShortString().toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
