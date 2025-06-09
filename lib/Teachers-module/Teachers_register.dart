import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Teacher_Login.dart';

class Teachers_Register extends StatefulWidget {
  const Teachers_Register({super.key});

  @override
  State<Teachers_Register> createState() => _Teachers_RegisterState();
}

class _Teachers_RegisterState extends State<Teachers_Register> {
  final form_key = GlobalKey<FormState>();

  final name_ctrl = TextEditingController();
  final age_ctrl = TextEditingController();
  final num_ctrl = TextEditingController();
  final place_ctrl = TextEditingController();
  final exp_ctrl = TextEditingController();
  final pswd_ctrl = TextEditingController();
  final sub_ctrl = TextEditingController();
  final email_ctrl = TextEditingController();

  // Future<void> teacher_data() async {
  //   if (form_key.currentState!.validate()) {
  //     FirebaseFirestore.instance.collection("Teachers_register").add({
  //       "Name": name_ctrl.text,
  //       "Experience": exp_ctrl.text,
  //       "Phone": num_ctrl.text,
  //       "Age": age_ctrl.text,
  //       "Subject": sub_ctrl.text,
  //       "Place": place_ctrl.text,
  //       "Password": pswd_ctrl.text,
  //       "Email":email_ctrl.text,
  //       "Status": 0,
  //       "Profile_path":
  //           "https://static.vecteezy.com/system/resources/previews/021/548/095/non_2x/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg"
  //     });
  //   }
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) {
  //       return TeacherLogin();
  //     },
  //   ));
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Account Created Successfully'),
  //   ));
  // }

  Future<void> teacher_data() async {
    if (form_key.currentState!.validate()) {
      try {
        // Create user in Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: email_ctrl.text.trim(), password: pswd_ctrl.text.trim());

        // Save additional teacher details in Firestore
        await FirebaseFirestore.instance
            .collection("Teachers_register")
            .doc(userCredential.user!.uid)
            .set({
          "Name": name_ctrl.text,
          "Experience": exp_ctrl.text,
          "Phone": num_ctrl.text,
          "Age": age_ctrl.text,
          "Subject": sub_ctrl.text,
          "Place": place_ctrl.text,
          "Password": pswd_ctrl.text,
          "Email": email_ctrl.text,
          "Status": 0,
          "Profile_path":
          "https://static.vecteezy.com/system/resources/previews/021/548/095/non_2x/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg"
        });

        // Navigate to login page
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return TeacherLogin();
          },
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Account Created Successfully'),
        ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message ?? "Registration failed"),
        ));
      }
    }
  }


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
          "Teacher Registration",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: name_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty name";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Name",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: email_ctrl,
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: age_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty age";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Age",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: sub_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty subject";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Subject",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: exp_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty experience";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Experience",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: pswd_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Password";
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: place_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Place";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Place",
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
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                child: TextFormField(
                  controller: num_ctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Number";
                    }
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Phone Number",
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
                    padding: EdgeInsets.only(top: 60.h,bottom: 20.h),
                    child: GestureDetector(
                      onTap: () => teacher_data(),
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            color: Color(0xff23ADB4),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "Submit",
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
            ],
          ),
        ),
      ),
    );
  }
}
