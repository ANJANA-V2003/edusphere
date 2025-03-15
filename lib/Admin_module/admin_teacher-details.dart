import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Teacher_details extends StatefulWidget {
  const Admin_Teacher_details({super.key});

  @override
  State<Admin_Teacher_details> createState() => _Admin_Teacher_detailsState();
}

class _Admin_Teacher_detailsState extends State<Admin_Teacher_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(CupertinoIcons.back, color: Colors.white),
      ),
      title: Text("Teachers",
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
                  "assets/images/catherine.png"), // Replace with actual image path
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 10),
            // Student Name
            Text(
              "Catherine",
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
                          Text("Experience :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600)),
                          SizedBox(width: 38.w,),
                          Text(" 2 years",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Subject :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 75.w,),
                          Text("English",
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
                          SizedBox(width: 110.w,),
                          Text("32",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 50.w,),
                          Text("Classes :",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(width: 70.w,),
                          Text(" 1,3,4",
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
                          SizedBox(width: 90.w,),
                          Text(" Feroke",
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
