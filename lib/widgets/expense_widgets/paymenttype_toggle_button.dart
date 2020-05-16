import 'package:bebetter/models/payment_type.dart';
import 'package:flutter/material.dart';

class PaymentTypeToggleButton extends StatelessWidget {
  
  final PaymentType paymentType;
  final Function(PaymentType) onToggleChange;

  PaymentTypeToggleButton({this.paymentType, this.onToggleChange});

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: BoxConstraints(maxHeight: 40),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Upi".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Cash".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Paytm".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      onPressed: (int index){
        onToggleChange(paymentTypeFromIndex(index));
      },
      isSelected: isSelectedEnum(paymentType),
      disabledColor: Colors.white,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: paymentTypeToColor(paymentType),
      borderColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      disabledBorderColor: Colors.black,
    );
  }
}
