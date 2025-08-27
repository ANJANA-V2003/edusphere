import 'package:edushpere/Parent_Students_module/attendance_calendar.dart';
import 'package:edushpere/Parent_Students_module/timetable_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'events_calendar.dart';

class Calendar_Tabbar extends StatefulWidget {
  const Calendar_Tabbar({super.key});

  @override
  State<Calendar_Tabbar> createState() => _Calendar_TabbarState();
}

class _Calendar_TabbarState extends State<Calendar_Tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Calendar',
          style:
          GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        bottom: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff0B99A0),
        ),
        tabs: [
          Tab(
            child: Text(
              'Attendance',
              style: GoogleFonts.poppins(
                // color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Timetable',
              style: GoogleFonts.poppins(
                // color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),Tab(
            child: Text(
              'Events',
              style: GoogleFonts.poppins(
                // color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      ),body: TabBarView(
        children: [
          Attendance_Calendar(), // Call the first class
          Timetable_Calendar(),
          Events_Calendar(),
          // Call the second class
        ],
      ),),
    );
  }
}
