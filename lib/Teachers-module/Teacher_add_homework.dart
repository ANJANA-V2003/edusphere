import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_AddHomework extends StatefulWidget {
  const Teacher_AddHomework({super.key});

  @override
  State<Teacher_AddHomework> createState() => _Teacher_AddHomeworkState();
}

class _Teacher_AddHomeworkState extends State<Teacher_AddHomework> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  Future<void> getdatas() async {
    SharedPreferences teacher_data = await SharedPreferences.getInstance();
    setState(() {
      User_id = teacher_data.getString("user_id");
    });
  }

  var User_id;

  TextEditingController _topicController = TextEditingController();
  TextEditingController _subController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? _selectedClass;

  final List<String> _classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5'
  ];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Future<void> add_homeworks() async {
    if (_topicController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('Teacher_Homeworks').add({
        'Topic': _topicController.text,
        'Subject':_subController.text,
        'date': _dateController.text,
        'class': _selectedClass,
        'Teacher_id': User_id,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Notification added successfully")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add notification: \$e")),
      );
    }
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
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Notification',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            Text('Subject',
                style: GoogleFonts.poppins(
                    fontSize: 17.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: _subController,
              decoration: InputDecoration(
                hintText: 'Enter subject',
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.black),
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
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
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text("Select Due Date",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 17.sp)),
            SizedBox(height: 10.h),
            TextField(
              controller: _dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                hintText: 'dd/mm/yyyy',
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.black),
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 30.h),
            DropdownButtonFormField<String>(
              value: _selectedClass,
              hint: Text(
                'Select class',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.black),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
              ),
              items: _classes.map((String className) {
                return DropdownMenuItem<String>(
                  value: className,
                  child: Text(className),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value;
                });
              },
            ),
            SizedBox(height: 60.h),
            Center(
              child: GestureDetector(
                onTap: add_homeworks,
                child: Container(
                  height: 60.h,
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
                          fontWeight: FontWeight.w600),
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
