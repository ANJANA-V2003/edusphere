import 'package:edushpere/Teachers-module/Teacher_examview.dart';
import 'package:edushpere/Teachers-module/Teacher_homework.dart';
import 'package:edushpere/Teachers-module/Teacher_quiz.dart';
import 'package:edushpere/Teachers-module/Teacher_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Home extends StatefulWidget {
  const Teacher_Home({super.key});

  @override
  State<Teacher_Home> createState() => _Teacher_HomeState();
}

class _Teacher_HomeState extends State<Teacher_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 140.h,
                width: 412.w,
                decoration: BoxDecoration(
                    color: Color(0xff23ADB4),
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
                                AssetImage("assets/images/catherine.png"),
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
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 205.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                        "assets/icons/lets-icons_bell-light.svg",width: 30.w,),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Catherine",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
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
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey.shade600,width: 2))),
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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Teacher_Quiz();
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
                        children: [SvgPicture.asset("assets/icons/quiz.svg")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create quiz",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff23ADB4)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "MCQ or written",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.grey.shade500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector( onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Teacher_Homework();
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
                        children: [SvgPicture.asset("assets/icons/books.svg")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10 Total",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff23ADB4)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Homeworks pushed",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.grey.shade500),
                          )
                        ],
                      )
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
              GestureDetector( onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Teacher_Students();
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
                        children: [SvgPicture.asset("assets/icons/students.svg")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "50 Total",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff23ADB4)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Students you have",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.grey.shade500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector( onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Teacher_Examview();
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
                        children: [SvgPicture.asset("assets/icons/class.svg")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "5 Total",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff23ADB4)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Exams you took",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.grey.shade500),
                          )
                        ],
                      )
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
