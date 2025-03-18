import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Notification extends StatefulWidget {
  const Teacher_Notification({super.key});

  @override
  State<Teacher_Notification> createState() => _Teacher_NotificationState();
}

class _Teacher_NotificationState extends State<Teacher_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      title: Text(
        'Notification',
        style:
        GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    ),);
  }
}
