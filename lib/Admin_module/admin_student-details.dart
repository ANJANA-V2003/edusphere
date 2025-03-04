import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Student_details extends StatefulWidget {
  const Admin_Student_details({super.key});

  @override
  State<Admin_Student_details> createState() => _Admin_Student_detailsState();
}

class _Admin_Student_detailsState extends State<Admin_Student_details> {
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
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 45.r,
              backgroundImage: AssetImage(
                  "assets/Elsa.png"), // Replace with actual image path
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 10),
            // Student Name
            Text(
              "Elsa",
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                height: 400.h,
                width: 340.w,
                decoration: BoxDecoration(
                    color: Color(0xffD4F6F8),
                    borderRadius: BorderRadius.all(Radius.circular(12.r))),
                child:
                Padding(
                  padding:  EdgeInsets.only(top: 60.h),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Guardian :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600)),
                          SizedBox(width: 33.w,),
                          Text(" Michael",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Class :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 75.w,),
                          Text("STD - 1",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Age :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 90.w,),
                          Text("9 years",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Phone :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 63.w,),
                          Text(" 6357912328",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Place :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 70.w,),
                          Text(" Calicut",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
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
