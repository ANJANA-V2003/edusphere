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
                height: 150.h,
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
                                  GestureDetector(onTap: () {

                                  },
                                    child: SvgPicture.asset(
                                        "assets/icons/lets-icons_bell-light.svg"),
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
