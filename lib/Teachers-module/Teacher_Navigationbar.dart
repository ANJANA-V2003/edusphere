import 'package:edushpere/Teachers-module/Teacher_calendar.dart';
import 'package:edushpere/Teachers-module/Teacher_home.dart';
import 'package:edushpere/Teachers-module/Teacher_message.dart';
import 'package:edushpere/Teachers-module/Teacher_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: _list.elementAt(_Index),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
              backgroundColor: Color(0xffD9D9D9)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.date_range_outlined,

              ),
              label: "Calendar",
              backgroundColor: Color(0xffD9D9D9)),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
              label: "Message",
              backgroundColor: Color(0xffD9D9D9)),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,

              ),
              label: "Profile",
              backgroundColor: Color(0xffD9D9D9)),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _Index,
        selectedItemColor:Color(0xff0B99A0),
        selectedIconTheme: IconThemeData(color: Color(0xff0B99A0)),
        selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,),
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5,
        backgroundColor: Colors.green[600],
      ),
    );
  }
}
