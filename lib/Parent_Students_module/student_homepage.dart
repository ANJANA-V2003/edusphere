import 'package:edushpere/Parent_Students_module/student_homeworks.dart';
import 'package:edushpere/Parent_Students_module/student_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Student_Homepage extends StatefulWidget {
  const Student_Homepage({super.key});

  @override
  State<Student_Homepage> createState() => _Student_HomepageState();
}

class _Student_HomepageState extends State<Student_Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                height: 110.h,
                width: 412.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r))),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          CircleAvatar(
                            radius: 35.r,
                            backgroundImage:
                                AssetImage("assets/images/father.jpg"),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Hello",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 205.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Student_Notification();
                                        },
                                      ));
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/lets-icons_bell-light.svg",
                                      width: 30.w,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Thomas",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: TextFormField(
              decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 3))),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150.h,
                width: 390.w,
                decoration: BoxDecoration(
                    color: Color(0xff23ADB4),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/Max.png"),
                            radius: 30.r,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Student Details",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Max Thomas",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Student ID : 50213",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Class 1",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  "Explore Academics",
                  style: GoogleFonts.poppins(
                      fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Teacher_Quiz();
                  //   },
                  // ));
                },
                child: Container(
                  height: 175.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff23ADB4)),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset("assets/icons/exam_icon.svg",width: 70.w,)],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Exams",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: Color(0xff23ADB4)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Student_Homeworks();
                    },
                  ));
                },
                child: Container(
                  height: 175.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff23ADB4)),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset("assets/icons/books.svg",width: 70.w,)],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Homeworks",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: Color(0xff23ADB4)),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Teacher_Students();
                  //   },
                  // ));
                },
                child: Container(
                  height: 175.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff23ADB4)),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/teacher_icon.svg",width: 70.w,)
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Teachers",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: Color(0xff23ADB4)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Teacher_Examview();
                  //   },
                  // ));
                },
                child: Container(
                  height: 175.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff23ADB4)),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset("assets/icons/result_icon.svg",width: 70.w,)],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Results",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                  color: Color(0xff23ADB4)),
                            )
                          ],
                        ),
                      ),
                    ],
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
