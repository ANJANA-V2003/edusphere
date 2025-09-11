import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Parent_Students_module/parents_login.dart';
import 'package:edushpere/Parent_Students_module/student_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  // final idctrl = TextEditingController();
  final phnctrl = TextEditingController();

  bool _isPasswordVisible = false;


  // Future<void> parents_data() async {
  //   if (form_key.currentState!.validate()) {
  //     FirebaseFirestore.instance.collection("Parents_register").add({
  //       "Name": namectrl.text,
  //       "Phone": phnctrl.text,
  //       "Email": mailctrl.text,
  //       "Password": pswdctrl.text,
  //       // "ID": idctrl.text,
  //       "Profile_path":
  //           "https://th.bing.com/th/id/OIP.A1JjNu8jIRxaTJHbD_EtFwHaIJ?rs=1&pid=ImgDetMain"
  //     });
  //   }
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) {
  //       return Student_Register();
  //     },
  //   ));
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Account Created Successfully'),
  //   ));
  //
  // }

  Future<void> parents_data() async {
    if (form_key.currentState!.validate()) {
      try {
        // Create the user with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: mailctrl.text.trim(),
          password: pswdctrl.text.trim(),
        );

        // Save additional user details to Firestore
        await FirebaseFirestore.instance
            .collection("Parents_register")
            .doc(userCredential.user!.uid)
            .set({
          "Name": namectrl.text,
          "Phone": phnctrl.text,
          "Email": mailctrl.text,
          "Profile_path":
              "https://openseauserdata.com/files/7f16cec1cc177a7e148067006e73c02a.png"
           // "https://th.bing.com/th/id/OIP.A1JjNu8jIRxaTJHbD_EtFwHaIJ?rs=1&pid=ImgDetMain"
        });

        // Navigate and show success
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Student_Register(),
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account Created Successfully')),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = "An error occurred";
        if (e.code == 'email-already-in-use') {
          errorMessage = "This email is already in use.";
        } else if (e.code == 'invalid-email') {
          errorMessage = "This email is invalid.";
        } else if (e.code == 'weak-password') {
          errorMessage = "Password should be at least 6 characters.";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
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
                  obscureText: !_isPasswordVisible, // Toggle based on state
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Empty password";
                    } else if (value.length < 6) {
                      return "Password too short";
                    }
                    return null;
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
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
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
                  controller: phnctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty phone number";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Phone number",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
              //   child: TextFormField(
              //     controller: idctrl,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return "Empty ID number";
              //       }
              //     },
              //     decoration: InputDecoration(
              //         fillColor: Color(0xffFFF8F8),
              //         filled: true,
              //         hintText: "ID number",
              //         hintStyle: GoogleFonts.poppins(
              //             fontSize: 15.sp, fontWeight: FontWeight.w600),
              //         border: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(width: 1.w, color: Colors.grey.shade400),
              //           borderRadius: BorderRadius.circular(8.r),
              //         )),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 120.h),
                    child: GestureDetector(
                      onTap: () => parents_data(),
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
