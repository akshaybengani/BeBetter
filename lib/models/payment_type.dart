import 'package:flutter/material.dart';

enum PaymentType { upi, cash, paytm }

extension ParseToString on PaymentType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

PaymentType stringToPaymentType(String type) {
  return PaymentType.values
      .firstWhere((e) => e.toString() == 'PaymentType.' + type);
}

Color paymentTypeToColor(PaymentType paymentType) {
  switch (paymentType) {
    case PaymentType.upi:
      return Colors.yellow.shade900;
    case PaymentType.cash:
      return Colors.green;
    case PaymentType.paytm:
      return Colors.blue;
    default:
      return Colors.yellow.shade900;
  }
}

PaymentType paymentTypeFromIndex(int index) {
  switch (index) {
    case 0:
      return PaymentType.upi;
    case 1:
      return PaymentType.cash;
    case 2:
      return PaymentType.paytm;
    default:
      return PaymentType.upi;
  }
}

List<bool> isSelectedEnum(PaymentType paymentType) {
  switch (paymentType) {
    case PaymentType.upi:
      return [true, false, false];
    case PaymentType.cash:
      return [false, true, false];
    case PaymentType.paytm:
      return [false, false, true];
    default:
      return [true, false, false];
  }
}
