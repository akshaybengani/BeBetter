import 'package:bebetter/screens/analysis_screen.dart';
import 'package:bebetter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to BeBetter",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber.shade100,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(
              Icons.home,
              color: Colors.pink,
            ),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_board, color: Colors.grey),
            activeIcon: Icon(
              Icons.developer_board,
              color: Colors.pink,
            ),
            title: Text(
              "Analysis",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
      body: pageIndex == 0 ? HomeScreen() : AnalysisScreen(),
    );
  }
}
