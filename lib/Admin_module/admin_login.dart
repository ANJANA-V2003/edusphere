import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Login extends StatefulWidget {
  const Admin_Login({super.key});

  @override
  State<Admin_Login> createState() => _Admin_LoginState();
}

class _Admin_LoginState extends State<Admin_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 210.h,
                width: 412.w,
                decoration: BoxDecoration(
                    color: Color(0xff23ADB4),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(41.r),
                        bottomRight: Radius.circular(41.r))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 48.sp),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 40.w,right: 40.w),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Color(0xffD9D9D9),
                  filled: true,
                  hintText: "Username",
                  hintStyle: GoogleFonts.dmSans(fontSize: 16.sp,fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none)),
            ),
          )
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 60.h,
          //       width: 350.w,
          //       decoration: BoxDecoration(
          //           color: Color(0xffD9D9D9),
          //           borderRadius: BorderRadius.circular(12.r)),
          //
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
