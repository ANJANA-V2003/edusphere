import 'package:edushpere/Teachers-module/Teacher_attendance.dart';
import 'package:edushpere/Teachers-module/Teacher_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Calendar extends StatefulWidget {
  const Teacher_Calendar({super.key});

  @override
  State<Teacher_Calendar> createState() => _Teacher_CalendarState();
}

class _Teacher_CalendarState extends State<Teacher_Calendar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Calendar',
            style: GoogleFonts.poppins(
                fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Color(0xff0B99A0),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Attendance',
                  style: GoogleFonts.poppins(
                    // color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Events',
                  style: GoogleFonts.poppins(
                    // color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [Teacher_Attendance(), Teacher_Events()],
        ),
      ),
    );
  }
}
