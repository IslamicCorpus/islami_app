import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/home/screens/home_view.dart';
import 'package:islami/modules/profile/screens/profile_view.dart';
import 'package:islami/modules/question_and_answer/screens/quest_and_answer_view.dart';
import 'package:islami/modules/quotes/screens/quotes_view.dart';
import 'package:islami/modules/shalat/screens/sholat_view.dart';

class BottonNavBar extends StatefulWidget {
  @override
  _BottonNavBarState createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    SholatView(),
    QuotesView(),
    QuestAndAnswerView(),
    ProfileView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        elevation: 12,
        fixedColor: Color(primaryColor),
        onTap: _onItemTapped,
        backgroundColor: Colors.red,
        unselectedIconTheme: IconThemeData(color: Colors.black45),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("Shalat"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text("Quotes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text("Q&A"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Akun"),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _settingModalBottomSheet(context);
      //   },
      //   backgroundColor: Color(primaryColor),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
