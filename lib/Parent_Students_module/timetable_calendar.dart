import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Timetable_Calendar extends StatefulWidget {
  const Timetable_Calendar({super.key});

  @override
  State<Timetable_Calendar> createState() => _Timetable_CalendarState();
}

class _Timetable_CalendarState extends State<Timetable_Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Container(
          width: 380.w,
          height: 70.h,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: Colors.black),
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "9:00 am - 10:00 am",
                    style: GoogleFonts.poppins(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
