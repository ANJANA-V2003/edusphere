import 'package:edushpere/Admin_module/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllers/admin login control.dart';

class Admin_Login extends StatefulWidget {
  const Admin_Login({super.key});

  @override
  State<Admin_Login> createState() => _Admin_LoginState();
}

class _Admin_LoginState extends State<Admin_Login> {
  final form_key = GlobalKey<FormState>();

  final namectrl = TextEditingController();
  final pswdctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
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
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.poppins(
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
            // Padding(
            //   padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 200.h),
            //   child: Obx(() => TextFormField(
            //     onChanged: (value) {
            //       loginController.username.value = value;
            //     },
            //     decoration: InputDecoration(
            //         fillColor: Color(0xffD9D9D9),
            //         filled: true,
            //         hintText: "Username",
            //         hintStyle: GoogleFonts.poppins(
            //             fontSize: 16.sp, fontWeight: FontWeight.w600),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(12.r),
            //             borderSide: BorderSide.none)),
            //   )),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 200.h),
              child: TextFormField(
                controller: namectrl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Empty username";
                  }
                },
                decoration: InputDecoration(
                    fillColor: Color(0xffD9D9D9),
                    filled: true,
                    hintText: "Username",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none)),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 45.h),
            //   child: Obx(() => TextFormField(
            //     onChanged: (value) {
            //       loginController.password.value = value;
            //     },
            //     decoration: InputDecoration(
            //         fillColor: Color(0xffD9D9D9),
            //         filled: true,
            //         hintText: "Password",
            //         hintStyle: GoogleFonts.poppins(
            //             fontSize: 16.sp, fontWeight: FontWeight.w600),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(12.r),
            //             borderSide: BorderSide.none)),
            //   )),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 45.h),
              child: TextFormField(
                controller: pswdctrl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Empty password";
                  }
                },
                decoration: InputDecoration(
                    fillColor: Color(0xffD9D9D9),
                    filled: true,
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none)),
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
                        if (namectrl.text == "Anjana" && pswdctrl.text == "anjana") {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Admin_Home();
                            },
                          ));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid username or password!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 120.h),
            //       child: GestureDetector(
            //         onTap: () {
            //           // Check if username and password are valid
            //           if (loginController.username.value.isNotEmpty &&
            //               loginController.password.value.isNotEmpty) {
            //             // If valid, navigate to Home page
            //             Get.to(() => Admin_Home());
            //           } else {
            //             // Show an error message if fields are empty
            //             Get.snackbar('Error', 'Please enter both username and password.',
            //                 snackPosition: SnackPosition.BOTTOM);
            //           }
            //         },
            //         child: Container(
            //           height: 50.h,
            //           width: 150.w,
            //           decoration: BoxDecoration(
            //               color: Color(0xff23ADB4),
            //               borderRadius: BorderRadius.circular(12.r)),
            //           child: Center(
            //             child: Text(
            //               "LOGIN",
            //               style: GoogleFonts.poppins(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 20.sp,
            //                   color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
