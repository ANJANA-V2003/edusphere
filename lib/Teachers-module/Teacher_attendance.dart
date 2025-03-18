import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Attendance extends StatefulWidget {
  const Teacher_Attendance({super.key});

  @override
  State<Teacher_Attendance> createState() => _Teacher_AttendanceState();
}

class _Teacher_AttendanceState extends State<Teacher_Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        child: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return Teacher_AttendeesReview();
            //   },
            // ));
          },
          child: Container(
            width: 380.w,
            height: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(width: 2.w, color: Colors.grey.shade400),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.w,),
                        Text("Class 1",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
