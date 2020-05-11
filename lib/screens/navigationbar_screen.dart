import 'package:bebetter/screens/analysis_screen.dart';
import 'package:bebetter/screens/app_drawer.dart';
import 'package:bebetter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int pageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Welcome to BeBetter",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.pink),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(child: AppDrawer()),
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
