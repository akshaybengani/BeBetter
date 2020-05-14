import 'package:fluttertoast/fluttertoast.dart';

Future<bool> showToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 1,
    fontSize: 20,
  );
}