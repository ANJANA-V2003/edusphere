import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_AddNotification extends StatefulWidget {
  const Teacher_AddNotification({super.key});

  @override
  State<Teacher_AddNotification> createState() =>
      _Teacher_AddNotificationState();
}

class _Teacher_AddNotificationState extends State<Teacher_AddNotification> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  Future<void> getdatas() async {
    SharedPreferences teacher_data= await SharedPreferences.getInstance();
    setState(() {
      User_id = teacher_data.getString("user_id");
    });
  }

  var User_id;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
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

  Future<void> notification() async {
    if (_titleController.text.isEmpty ||
        _detailsController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('Teacher_notifications').add({
        'title': _titleController.text,
        'details': _detailsController.text,
        'date': _dateController.text,
        'class': _selectedClass,
        'timestamp': FieldValue.serverTimestamp(),
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
          'Notification',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Notification',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            Text('Title',
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500)),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter title',
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
            SizedBox(height: 15.h),
            Text('Details',
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500)),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(
                hintText: 'Enter details',
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
              maxLines: 3,
            ),
            SizedBox(height: 15.h),
            Text('Date',
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500)),
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
            SizedBox(height: 15.h),
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
            SizedBox(height: 220.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 55.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                        child: Text('Cancel',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                GestureDetector(
                  onTap:() =>notification() ,
                  child: Container(
                    height: 55.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Color(0xff23ADB4),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                        child: Text('Save',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
