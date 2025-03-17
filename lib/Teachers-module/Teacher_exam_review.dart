import 'package:edushpere/Teachers-module/Attendees_list.dart';
import 'package:edushpere/Teachers-module/Missed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_ExamReview extends StatefulWidget {
  const Teacher_ExamReview({super.key});

  @override
  State<Teacher_ExamReview> createState() => _Teacher_ExamReviewState();
}

class _Teacher_ExamReviewState extends State<Teacher_ExamReview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold( appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Review',
          style:
          GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),bottom: TabBar(
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
              'Attendees',
              style: GoogleFonts.poppins(
                // color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Missed',
              style: GoogleFonts.poppins(
                // color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      ),body: TabBarView(
        children: [
          AttendeesList(), // Call the first class
          Missed_List(),
          // Call the second class
        ],
      ),),

    );
  }
}
