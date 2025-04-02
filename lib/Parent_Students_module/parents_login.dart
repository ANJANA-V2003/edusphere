import 'package:edushpere/Parent_Students_module/parents_navigationbar.dart';
import 'package:edushpere/Parent_Students_module/student_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Parents_Login extends StatefulWidget {
  const Parents_Login({super.key});

  @override
  State<Parents_Login> createState() => _Parents_LoginState();
}

class _Parents_LoginState extends State<Parents_Login> {
  final form_key = GlobalKey<FormState>();

  final namectrl = TextEditingController();
  final pswdctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
                                  "Welcome Back",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
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
                                  "Login to continue",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25.sp),
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 200.h),
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
                        borderRadius: BorderRadius.circular(10.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 45.h),
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
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                        BorderSide(width: 1.w, color: Colors.grey.shade400),
                      )),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 50.w, top: 10.h),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password ?",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  )
                ],
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
                              return Student_Homepage();
                            },
                          ));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Color(0xff23ADB4),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),);
  }
}
