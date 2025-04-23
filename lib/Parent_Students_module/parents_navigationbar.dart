import 'package:edushpere/Parent_Students_module/Students_quiz.dart';
import 'package:edushpere/Parent_Students_module/calendar_tabbar.dart';
import 'package:edushpere/Parent_Students_module/student_homepage.dart';
import 'package:edushpere/Parent_Students_module/student_teacher_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Parents_Navigationbar extends StatefulWidget {
  const Parents_Navigationbar({super.key});

  @override
  State<Parents_Navigationbar> createState() => _Parents_NavigationbarState();
}

class _Parents_NavigationbarState extends State<Parents_Navigationbar> {
  int _Index = 0;
  static const List<dynamic> _list = [
    Student_Homepage(),
    StudentsQuiz(),
    Student_TeacherChats(),
    Calendar_Tabbar(),
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
              icon: Icon(CupertinoIcons.question),
              label: "Quiz",
              backgroundColor: Color(0xffD9D9D9)),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
              label: "Message",
              backgroundColor: Color(0xffD9D9D9)),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.calendar,
              ),
              label: "Calendar",
              backgroundColor: Color(0xffD9D9D9)),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _Index,
        selectedItemColor: Color(0xff0B99A0),
        selectedIconTheme: IconThemeData(color: Color(0xff0B99A0)),
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5,
        backgroundColor: Colors.green[600],
      ),
    );
  }
}
