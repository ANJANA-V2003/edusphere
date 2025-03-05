import 'package:edushpere/Admin_module/admin_add_timetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Timetable extends StatefulWidget {
  const Admin_Timetable({super.key});

  @override
  State<Admin_Timetable> createState() => _Admin_TimetableState();
}

class _Admin_TimetableState extends State<Admin_Timetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Time table",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Admin_AddTimetable();
                },
              ));
            },
            child: Container(
              width: 380.w,
              height: 70.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: Colors.grey.shade400),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 40.w),
                  Expanded(
                      child: Text("Class 1",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600))),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(Icons.edit),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Icon(Icons.delete_outline_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        backgroundColor: Color(0xff23ADB4),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp,
        ),
        onPressed: () {},
      ),
    );
  }
}
