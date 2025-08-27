import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Student_Resultpage extends StatefulWidget {
  const Student_Resultpage({super.key});

  @override
  State<Student_Resultpage> createState() => _Student_ResultpageState();
}

class _Student_ResultpageState extends State<Student_Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result',
            style: GoogleFonts.poppins(
                fontSize: 20.sp, fontWeight: FontWeight.w600)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),

            // Ratings
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Behaviour',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    ),
                    Expanded(
                      flex: 3,
                      child: RatingBarIndicator(
                        rating: 4,
                        itemCount: 5,
                        itemSize: 24.sp,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Attendance',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    ),
                    Expanded(
                      flex: 3,
                      child: RatingBarIndicator(
                        rating: 4,
                        itemCount: 5,
                        itemSize: 24.sp,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Work',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    ),
                    Expanded(
                      flex: 3,
                      child: RatingBarIndicator(
                        rating: 4,
                        itemCount: 5,
                        itemSize: 24.sp,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                ]
            ),
                SizedBox(height: 60.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 300.h,
                          width: 360.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE9F9FA),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('Subjects',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp)),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('Marks',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp)),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('Grade',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('Math',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff757575))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('60',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('B',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('English',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff757575))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('85',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('A',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('EVS',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff757575))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('80',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('A',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('IT',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff757575))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('75',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('B',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                    child: Text('Language',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff757575))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('75',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text('B',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff0B99A0))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
