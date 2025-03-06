import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_AddTimetable extends StatefulWidget {
  const Admin_AddTimetable({super.key});

  @override
  State<Admin_AddTimetable> createState() => _Admin_AddTimetableState();
}

class _Admin_AddTimetableState extends State<Admin_AddTimetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
    ),);
  }
}
