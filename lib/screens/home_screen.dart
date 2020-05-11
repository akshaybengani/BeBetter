import 'package:bebetter/screens/expense_screen.dart';
import 'package:bebetter/screens/food_screen.dart';
import 'package:bebetter/screens/mood_screen.dart';
import 'package:bebetter/screens/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MoodScreen(),
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/images/moods.svg",
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Text(
                        "Moods".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExpenseScreen(),
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/images/expenses.svg",
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Text(
                        "Expenses".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoodScreen(),
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/images/foods.svg",
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Text(
                        "Foods".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NoteScreen(),
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/images/notes.svg",
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Text(
                        "Notes".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
