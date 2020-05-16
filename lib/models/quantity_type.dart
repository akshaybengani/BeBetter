import 'package:flutter/material.dart';

enum QuantityType { kg, pack, li }

extension ParseToString on QuantityType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

QuantityType stringToQuantityType(String type) {
  return QuantityType.values
      .firstWhere((e) => e.toString() == 'QuantityType.' + type);
}

Color quantityTypeToColor(QuantityType quantityType) {
  switch (quantityType) {
    case QuantityType.kg:
      return Colors.green;
    case QuantityType.pack:
      return Colors.blue;
    case QuantityType.li:
      return Colors.red;
    default:
      return Colors.blue;
  }
}

QuantityType quantityTypeFromIndex(int index) {
  switch (index) {
    case 0:
      return QuantityType.kg;
    case 1:
      return QuantityType.pack;
    case 2:
      return QuantityType.li;
    default:
      return QuantityType.pack;
  }
}

List<bool> isSelectedEnum(QuantityType quantityType) {
  switch (quantityType) {
    case QuantityType.kg:
      return [true, false, false];
    case QuantityType.pack:
      return [false, true, false];
    case QuantityType.li:
      return [false, false, true];
    default:
      return [false, true, false];
  }
}
