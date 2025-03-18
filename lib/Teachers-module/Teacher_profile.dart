import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Profile extends StatefulWidget {
  const Teacher_Profile({super.key});

  @override
  State<Teacher_Profile> createState() => _Teacher_ProfileState();
}

class _Teacher_ProfileState extends State<Teacher_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Profile',
        style:
        GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w600),
      ),
    ),);
  }
}
