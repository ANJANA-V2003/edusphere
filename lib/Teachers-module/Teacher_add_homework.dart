import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Teacher_AddHomework extends StatefulWidget {
  const Teacher_AddHomework({super.key});

  @override
  State<Teacher_AddHomework> createState() => _Teacher_AddHomeworkState();
}

class _Teacher_AddHomeworkState extends State<Teacher_AddHomework> {
  TextEditingController _topicController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addHomework() {
    String topic = _topicController.text.trim();
    if (topic.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homework',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter topic",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 17.sp)),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                controller: _topicController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter homework details...",
                  hintStyle: GoogleFonts.poppins(fontSize: 15.sp,fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text("Select Due Date",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 17.sp)),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                      style: GoogleFonts.poppins(fontSize: 15.sp,fontWeight: FontWeight.w500),
                    ),
                    SvgPicture.asset("assets/icons/date_icon.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60.h),
            Center(
              child: GestureDetector(
                onTap: _addHomework,
                child: Container(height: 60.h,
                 width: 180.w,
                  decoration: BoxDecoration(
                    color: Color(0xff0B99A0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight:FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
