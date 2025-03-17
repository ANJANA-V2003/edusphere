import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Students extends StatefulWidget {
  const Teacher_Students({super.key});

  @override
  State<Teacher_Students> createState() => _Teacher_StudentsState();
}

class _Teacher_StudentsState extends State<Teacher_Students> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Students',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return Admin_Student_details();
              //   },
              // ));
            },
            child: Container(
              width: 380.w,
              height: 70.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(width: 2.w, color: Colors.grey.shade400),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Elsa.png")),
                  SizedBox(width: 30.w),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Elsa",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Class 1",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff757575))),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
