import 'package:bebetter/models/quantity_type.dart';
import 'package:flutter/material.dart';

class QuantityTypeToggleButton extends StatelessWidget {
  
  final QuantityType quantityType;
  final Function(QuantityType) onToggleChange;

  QuantityTypeToggleButton({this.quantityType, this.onToggleChange});

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: BoxConstraints(maxHeight: 40),
      children: <Widget>[
        
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Kg".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Pack".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Li".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      onPressed: (int index){
        onToggleChange(quantityTypeFromIndex(index));
      },
      isSelected: isSelectedEnum(quantityType),
      disabledColor: Colors.white,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: quantityTypeToColor(quantityType),
      borderColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      disabledBorderColor: Colors.black,
    );
  }
}
