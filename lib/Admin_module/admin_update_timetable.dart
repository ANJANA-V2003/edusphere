import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_UpdateTimetable extends StatefulWidget {
  const Admin_UpdateTimetable(
      {super.key, required this.docId, required this.timetableData});

  final String docId;
  final Map<String, dynamic> timetableData;

  @override
  State<Admin_UpdateTimetable> createState() => _Admin_UpdateTimetableState();
}

class _Admin_UpdateTimetableState extends State<Admin_UpdateTimetable> {
  // List of available classes
  final List<String> classes = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  String? selectedClass; // stores selected class

  late TextEditingController _ninecntrl = TextEditingController();
  late TextEditingController _tencntrl = TextEditingController();
  late TextEditingController _elevncntrl = TextEditingController();
  late TextEditingController _twlvecntrl = TextEditingController();
  late TextEditingController _onecntrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedClass = widget.timetableData["Class"];

    _ninecntrl = TextEditingController(text: widget.timetableData["9:00 am"]);
    _tencntrl = TextEditingController(text: widget.timetableData["10:00 am"]);
    _elevncntrl = TextEditingController(text: widget.timetableData["11:00 am"]);
    _twlvecntrl = TextEditingController(text: widget.timetableData["12:00 pm"]);
    _onecntrl = TextEditingController(text: widget.timetableData["1:00 pm"]);
  }

  @override
  void dispose() {
    _ninecntrl.dispose();
    _tencntrl.dispose();
    _elevncntrl.dispose();
    _twlvecntrl.dispose();
    _onecntrl.dispose();
    super.dispose();
  }

  Future<void> update_timeTable() async {
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

    try {
      await FirebaseFirestore.instance
          .collection("Admin_Timetable")
          .doc(widget.docId)
          .update({
        "9:00 am": _ninecntrl.text,
        "10:00 am": _tencntrl.text,
        "11:00 am": _elevncntrl.text,
        "12:00 pm": _twlvecntrl.text,
        "1:00 pm": _onecntrl.text,
        "Class": selectedClass,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Timetable updated successfully")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update the Timetable: \$e")),
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
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: Text(
                  "Class ${selectedClass}",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 23.sp),
                ),
              )
            ],
          ),
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
              GestureDetector(
                onTap: () => update_timeTable(),
                child: Container(
                  height: 60.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      color: Color(0xff0B99A0),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Center(
                    child: Text(
                      "Update",
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
