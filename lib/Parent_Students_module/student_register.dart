import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Student_Register extends StatefulWidget {
  const Student_Register({super.key});

  @override
  State<Student_Register> createState() => _Student_RegisterState();
}

class _Student_RegisterState extends State<Student_Register> {
  final form_key = GlobalKey<FormState>();

  final fnamectrl = TextEditingController();
  final lnamectrl = TextEditingController();
  final mailctrl = TextEditingController();
  final numctrl = TextEditingController();
  final placectrl = TextEditingController();
  final stdnt_idctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text(
          "Student Registration",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                child: TextFormField(
                  controller: fnamectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty first name";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffD9D9D9),
                      filled: true,
                      hintText: "First Name",
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
                  controller: lnamectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty last name";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffD9D9D9),
                      filled: true,
                      hintText: "Last Name",
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
                      fillColor: Color(0xffD9D9D9),
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
                  controller: stdnt_idctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Id";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffD9D9D9),
                      filled: true,
                      hintText: "Student ID",
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
                        // if (form_key.currentState!.validate()) {
                        //   Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) {
                        //       return Teacher_Navigationbar();
                        //     },
                        //   ));
                        // }
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
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return Parents_Register();
                          //   },
                          // ));
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
