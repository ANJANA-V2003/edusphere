import 'package:cloud_firestore/cloud_firestore.dart';
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
  // List of available classes
  final List<String> classes = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  String? selectedClass; // stores selected class

  final TextEditingController _ninecntrl = TextEditingController();
  final TextEditingController _tencntrl = TextEditingController();
  final TextEditingController _elevncntrl = TextEditingController();
  final TextEditingController _twlvecntrl = TextEditingController();
  final TextEditingController _onecntrl = TextEditingController();

  Future<void> add_timeTable() async {
    if (_ninecntrl.text.isEmpty ||
        _tencntrl.text.isEmpty ||
        _elevncntrl.text.isEmpty ||
        _twlvecntrl.text.isEmpty ||
        _onecntrl.text.isEmpty ||
        selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try{
      await FirebaseFirestore.instance.collection("Admin_Timetable").add({
        "9:00 am" : _ninecntrl.text,
        "10:00 am" : _tencntrl.text,
        "11:00 am" : _elevncntrl.text,
        "12:00 pm" : _twlvecntrl.text,
        "1:00 pm" : _onecntrl.text,
        "Class" : selectedClass,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Timetable added successfully")),
      );

      Navigator.pop(context);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add the Timetable: \$e")),
      );
    }
  }

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
      body: ListView(
        children: [
          // 🔽 Dropdown to select class
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Class",
                labelStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              value: selectedClass,
              items: classes.map((className) {
                return DropdownMenuItem(
                  value: className,
                  child: Text(
                    "Class ${className}",
                    style: GoogleFonts.poppins(fontSize: 16.sp),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),
          ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: 20.w, top: 15.h),
          //       child: Text(
          //         "Class 1",
          //         style: GoogleFonts.poppins(
          //             fontWeight: FontWeight.w700, fontSize: 23.sp),
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 600.h,
                width: 344.w,
                decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 20.h),
                          child: Text(
                            "Add Timetable",
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 20.h),
                          child: Text(
                            "9:00 am",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: TextFormField(
                        controller: _ninecntrl,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter subject",
                            hintStyle: GoogleFonts.poppins(fontSize: 15.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(width: 2.w))),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 10.h),
                          child: Text(
                            "10:00 am",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: TextFormField(
                        controller: _tencntrl,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter subject",
                            hintStyle: GoogleFonts.poppins(fontSize: 15.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(width: 2.w))),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 10.h),
                          child: Text(
                            "11:00 am",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: TextFormField(
                        controller: _elevncntrl,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter subject",
                            hintStyle: GoogleFonts.poppins(fontSize: 15.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(width: 2.w))),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 10.h),
                          child: Text(
                            "12:00 pm",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: TextFormField(
                        controller: _twlvecntrl,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter subject",
                            hintStyle: GoogleFonts.poppins(fontSize: 15.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(width: 2.w))),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, top: 10.h),
                          child: Text(
                            "1:00 pm",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                      child: TextFormField(
                        controller: _onecntrl,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Enter subject",
                            hintStyle: GoogleFonts.poppins(fontSize: 15.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(width: 2.w))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: () => add_timeTable(),
                child: Container(
                  height: 60.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      color: Color(0xff0B99A0),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
