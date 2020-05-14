import 'package:bebetter/screens/navigationbar_screen.dart';
import 'package:bebetter/widgets/util/helpers.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.pink),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Enter",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Access Key"),
                  controller: _accessKeyController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              
                RaisedButton(
                  onPressed: () async {

                    if(_accessKeyController.text.isNotEmpty){

                      


                    } else{
                      showToast("Chutiye access key mae kuch toh daal");
                    }


                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavigationBarScreen(),
                    ));
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
