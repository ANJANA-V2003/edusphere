import 'package:edushpere/Parent_Students_module/parents_login.dart';
import 'package:edushpere/Parent_Students_module/student_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Parents_Register extends StatefulWidget {
  const Parents_Register({super.key});

  @override
  State<Parents_Register> createState() => _Parents_RegisterState();
}

class _Parents_RegisterState extends State<Parents_Register> {
  final form_key = GlobalKey<FormState>();

  final namectrl = TextEditingController();
  final pswdctrl = TextEditingController();
  final mailctrl = TextEditingController();
  final idctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
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
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                ),
                                child: Text(
                                  "Let's Get Started",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35.sp),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Text(
                                  "Register Now",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23.sp),
                                ),
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
                child: TextFormField(
                  controller: namectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty username";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Username",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: pswdctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty password";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: mailctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty email";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: idctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Id";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "ID number",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 120.h),
                    child: GestureDetector(
                      onTap: () {
                        if (form_key.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Student_Register();
                            },
                          ));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Color(0xff23ADB4),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "Create a new account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                      style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff757575)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Parents_Login();
                            },
                          ));
                        },
                        child: Text(
                          "Log in",
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff23ADB4)),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
