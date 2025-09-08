import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Teachers-module/Teacher_examview.dart';
import 'package:edushpere/Teachers-module/Teacher_homework.dart';
import 'package:edushpere/Teachers-module/Teacher_notification.dart';
import 'package:edushpere/Teachers-module/Teacher_quiz.dart';
import 'package:edushpere/Teachers-module/Teacher_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_Home extends StatefulWidget {
  const Teacher_Home({super.key});

  @override
  State<Teacher_Home> createState() => _Teacher_HomeState();
}

class _Teacher_HomeState extends State<Teacher_Home> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  Future<void> getdatas() async {
    SharedPreferences teacher_data = await SharedPreferences.getInstance();
    setState(() {
      User_id = teacher_data.getString("user_id");
    });
  }

  var User_id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("Teachers_register")
          .doc(User_id)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); //loading action , shows that data is
        }

        if (snapshot.hasError) {
          // to check if there is data if not it returns the text
          return Center(child: Text("User not found"));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No data found"));
        }

        final teacher_detail = snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      height: 140.h,
                      width: 412.w,
                      decoration: BoxDecoration(
                          color: Color(0xff23ADB4),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(28.r),
                              bottomRight: Radius.circular(28.r))),
                      child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return Teacher_Notification();
                                              },
                                            ));
                                          },
                                          child: SvgPicture.asset(
                                            "assets/icons/lets-icons_bell-light.svg",
                                            width: 30.w,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          teacher_detail["Name"] ??
                                              "No data found",
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
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.search),
                //         hintText: "Search",
                //         hintStyle: GoogleFonts.poppins(
                //             fontWeight: FontWeight.w500,
                //             fontSize: 15.sp,
                //             color: Colors.grey.shade600),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10.r),
                //             borderSide: BorderSide(
                //                 color: Colors.grey.shade600, width: 2))),
                //   ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 150.h, // fixed height for the horizontal banner
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Admin_Notices")
                        // .orderBy("timestamp", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(child: Text("No notices available."));
                      }
                      var notices = snapshot.data!.docs;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: notices.length,
                        itemBuilder: (context, index) {
                          final notice = notices[index];
                          return Container(
                            width: 280.w,
                            margin: EdgeInsets.only(
                                left: 20.w, right: 10.w, bottom: 10.h, top: 5.h),
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Color(0xff23ADB4),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.r,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  notice["Title"] ?? "No Title",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  notice["Details"] ?? "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.sp, color: Colors.white70),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  notice["Date"] ?? "",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp, color: Colors.white60),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Text(
                        "Explore Academics",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Teacher_Quiz();
                          },
                        ));
                      },
                      child: Container(
                        height: 175.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xff23ADB4)),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/quiz.svg")
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create quiz",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Color(0xff23ADB4)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Teacher_Homework();
                          },
                        ));
                      },
                      child: Container(
                        height: 175.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xff23ADB4)),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/books.svg")
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Homeworks",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Color(0xff23ADB4)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Teacher_Students();
                          },
                        ));
                      },
                      child: Container(
                        height: 175.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xff23ADB4)),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/students.svg")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total students",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Color(0xff23ADB4)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Teacher_Examview();
                          },
                        ));
                      },
                      child: Container(
                        height: 175.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xff23ADB4)),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/class.svg")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Exams you took",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Color(0xff23ADB4)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
