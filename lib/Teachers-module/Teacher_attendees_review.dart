import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_AttendeesReview extends StatefulWidget {
  const Teacher_AttendeesReview({super.key});

  @override
  State<Teacher_AttendeesReview> createState() =>
      _Teacher_AttendeesReviewState();
}

class _Teacher_AttendeesReviewState extends State<Teacher_AttendeesReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Review',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Student name : Elsa",
                style: GoogleFonts.poppins(
                    fontSize: 17.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Student class : Class 1",
                style: GoogleFonts.poppins(
                    fontSize: 17.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: Container(
                  width: 380.w,
                  height: 320.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey.shade400),
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 5.h),
                            child: Text("Question 1",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 20.h),
                            child: SizedBox(
                              width: 340.w,
                              child: Text(
                                "If (x) is an integer, what is the value of (x) if (2x + 3 = 11).",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 5.h),
                            child: Text("Answer",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 360.w,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(height: 15.h),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      "4",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                              color: Color(0xffE11818),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child:
                                SvgPicture.asset("assets/icons/cross_icon.svg",fit: BoxFit.none,),
                          ),
                          Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                                color: Color(0xff18CA39),
                                borderRadius: BorderRadius.circular(30.r)),
                            child:  SvgPicture.asset("assets/icons/tick_icon.svg",fit: BoxFit.none,),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
