import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_AddNotification extends StatefulWidget {
  const Teacher_AddNotification({super.key});

  @override
  State<Teacher_AddNotification> createState() => _Teacher_AddNotificationState();
}

class _Teacher_AddNotificationState extends State<Teacher_AddNotification> {
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
