import 'package:edushpere/Admin_module/admin_student-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Students extends StatefulWidget {
  const Admin_Students({super.key});

  @override
  State<Admin_Students> createState() => _Admin_StudentsState();
}

class _Admin_StudentsState extends State<Admin_Students> {
  int selectedCategory = 0;

  final List<String> categories = [
    "Class 1",
    "Class 2",
    "Class 3",
    "Class 4",
    "Class 5"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Students",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: ChoiceChip(
                  checkmarkColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  label: Text(
                    categories[index],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                  ),
                  selected: selectedCategory == index,
                  selectedColor: Color(0xff23ADB4),
                  backgroundColor: Color(0xffA3F2F7),
                  onSelected: (_) => setState(() => selectedCategory = index),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Admin_Student_details();
                      },
                    ));
                  },
                  child: Container(
                    width: 380.w,
                    height: 70.h,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: Colors.grey.shade400),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("assets/images/Elsa.png")),
                        SizedBox(width: 10.w),
                        Expanded(
                            child: Text("Elsa",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500))),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
