import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Events extends StatefulWidget {
  const Teacher_Events({super.key});

  @override
  State<Teacher_Events> createState() => _Teacher_EventsState();
}

class _Teacher_EventsState extends State<Teacher_Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: Container(
                  width: 380.w,
                  height: 130.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey.shade400),
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/event.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                    ),
                                    child: Text("Visit to the Planatarium",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  // Padding(
                                  //   padding:
                                  //       EdgeInsets.only(right: 10.w, top: 5.h),
                                  //   child: Text("Due : 17-03-2025",
                                  //       style: GoogleFonts.poppins(
                                  //           fontSize: 16.sp,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Color(0xff0B99A0))),
                                  // ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                    ),
                                    child: Text("9:00 AM - 2:00 PM",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 10.w),
                                  child: Text("Date : 17-03-2025",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff0B99A0))),
                                ),],)
                            ],
                          ),
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
