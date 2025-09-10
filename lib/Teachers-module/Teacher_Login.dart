import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Teachers-module/Teacher_Navigationbar.dart';
import 'package:edushpere/Teachers-module/Teacher_home.dart';
import 'package:edushpere/Teachers-module/Teachers_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLogin extends StatefulWidget {
  const TeacherLogin({super.key});

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final form_key = GlobalKey<FormState>();

  final mail_ctrl = TextEditingController();
  final pswd_ctrl = TextEditingController();
  String id = "";

  bool isLoading = false;

  // Future<void> teacherLogin() async {
  //   try {
  //     setState(() => isLoading = true);
  //
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: mail_ctrl.text.trim(),
  //       password: pswd_ctrl.text.trim(),
  //     );
  //
  //     SharedPreferences teacherData = await SharedPreferences.getInstance();
  //     teacherData.setString("user_id", credential.user!.uid);
  //
  //     Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) => Teacher_Navigationbar(),
  //     ));
  //   } on FirebaseAuthException catch (e) {
  //     String message = "Login failed. Please try again.";
  //     if (e.code == 'user-not-found') {
  //       message = "No user found with this email.";
  //     } else if (e.code == 'wrong-password') {
  //       message = "Incorrect password.";
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message), backgroundColor: Colors.red),
  //     );
  //   } finally {
  //     setState(() => isLoading = false);
  //   }
  // }

  Future<void> teacherLogin() async {
    try {
      setState(() => isLoading = true);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail_ctrl.text.trim(),
        password: pswd_ctrl.text.trim(),
      );

      // Get UID
      final uid = credential.user!.uid;

      // Fetch teacher document using UID
      final doc = await FirebaseFirestore.instance
          .collection("Teachers_register")
          .doc(uid)
          .get();

      if (doc.exists) {
        final status = doc['Status'];

        if (status == 1) {
          SharedPreferences teacherData = await SharedPreferences.getInstance();
          teacherData.setString("user_id", uid);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Teacher_Navigationbar()),
          );
        } else if(status == 0 || status==2) {
          // await FirebaseAuth.instance.signOut(); // sign out if rejected

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Your account request was rejected or not approved yet."),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No matching teacher record found."),
            backgroundColor: Colors.red,
          ),
        );
        await FirebaseAuth.instance.signOut(); // No matching Firestore doc
      }
    } on FirebaseAuthException catch (e) {
      String message = "Login failed. Please try again.";
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }


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
                                  "EduSphere",
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
                                      fontWeight: FontWeight.w600,
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
                  controller:   mail_ctrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }
                      return null;
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
                        borderRadius: BorderRadius.circular(10.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 45.h),
                child: TextFormField(
                  controller: pswd_ctrl,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffD9D9D9),
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
              ElevatedButton(
                onPressed: () {
                  if (form_key.currentState!.validate()) {
                    teacherLogin();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff23ADB4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have account ? ",
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff757575)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Teachers_Register();
                          },
                        ));
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff23ADB4)),
                      ))],)
            ],
          ),
        ),
      ),
    );
  }
}
