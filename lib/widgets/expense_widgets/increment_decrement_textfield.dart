import 'package:flutter/material.dart';

class IncrementDecrementTextField extends StatelessWidget {
  final int count;
  final Function(int) onCountChange;
  final Color color;

  IncrementDecrementTextField({this.count, this.onCountChange, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      width: 104,
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                onCountChange(-1);
              },
              padding: EdgeInsets.all(0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            alignment: Alignment.center,
            width: 40,
            height: 30,
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15)),
            ),
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onCountChange(1);
              },
              padding: EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
