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
    return Scaffold( appBar: AppBar(
      centerTitle: true,
      title: Text(
        'Review',
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
