import 'package:edushpere/Teachers-module/Teacher_calendar.dart';
import 'package:edushpere/Teachers-module/Teacher_home.dart';
import 'package:edushpere/Teachers-module/Teacher_message.dart';
import 'package:edushpere/Teachers-module/Teacher_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teacher_Navigationbar extends StatefulWidget {
  const Teacher_Navigationbar({super.key});

  @override
  State<Teacher_Navigationbar> createState() => _Teacher_NavigationbarState();
}

class _Teacher_NavigationbarState extends State<Teacher_Navigationbar> {
  int _Index = 0;
  static const List<dynamic> _list = [
    Teacher_Home(),
    Teacher_Calendar(),
    Teacher_Message(),
    Teacher_Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _Index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _list.elementAt(_Index),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.update_rounded,
                color: Colors.white,
              ),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              label: "Calendar",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              label: "Message",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
                color: Colors.white,
              ),
              label: "Profile",
              backgroundColor: Colors.black),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _Index,
        selectedItemColor: Colors.white,selectedIconTheme: IconThemeData(color: Colors.green,),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5,backgroundColor: Colors.green[600],
      ),);
  }
}
