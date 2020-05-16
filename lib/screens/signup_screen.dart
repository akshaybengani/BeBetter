import 'package:bebetter/repositories/user_repository.dart';
import 'package:bebetter/screens/navigationbar_screen.dart';
import 'package:bebetter/services/share_prefs_service.dart';
import 'package:bebetter/widgets/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _accessKeyController;

  @override
  void initState() {
    _accessKeyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _accessKeyController.clear();
    _accessKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome to BeBetter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "We dont need your personal details\nWe just track your every activity and expense you do in your daily life\n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Create or enter your Access Key",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                helperText: "Keep it safe unless you will loose your data",
                helperMaxLines: 2,
                helperStyle: TextStyle(
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.content_paste,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    _accessKeyController.text =
                        await FlutterClipboardManager.copyFromClipBoard();
                  },
                ),
              ),
              controller: _accessKeyController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.greenAccent,
              onPressed: () async {
                await onPressed();
              },
              child: Text(
                "Validate".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    if (_accessKeyController.text.isNotEmpty) {
      await userRepository
          .createUserByAccessKey(_accessKeyController.text)
          .then((result) async {
        if (result == "existing_user") {
          // User Already Exists
          await userRepository
              .getUserByAccessKey(_accessKeyController.text)
              .then((user) async {
            userRepository.setUserIdInSharePref(user.id);
            print(await userRepository.getUserIdFromSharePref());

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => NavigationBarScreen(),
              ),
            );
          });
        } else if (result == null) {
          showToast("Some Problem occured");
        } else {
          // User Not Exisit new user created
          showToast(result);

          userRepository.setUserIdInSharePref(result);
          print(await userRepository.getUserIdFromSharePref());

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NavigationBarScreen(),
            ),
          );
        }

        closeKeyboard(context);
        _accessKeyController.clear();
      });
    } else {
      showToast("Chutiye Access Key mae kuch toh daal");
    }
  }
}

//.then((_) {

//   closeKeyboard(context);
//   _accessKeyController.clear();

// }).catchError((onError) {
//   print(onError);
//   closeKeyboard(context);
//   _accessKeyController.clear();
// });
