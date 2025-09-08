import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Parent_Students_module/Student_resultpage.dart';
import 'package:edushpere/Parent_Students_module/student_exams.dart';
import 'package:edushpere/Parent_Students_module/student_homeworks.dart';
import 'package:edushpere/Parent_Students_module/student_notificationview.dart';
import 'package:edushpere/Parent_Students_module/teachers_info_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Homepage extends StatefulWidget {
  const Student_Homepage({super.key});

  @override
  State<Student_Homepage> createState() => _Student_HomepageState();
}

class _Student_HomepageState extends State<Student_Homepage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  Future<void> getdatas() async {
    SharedPreferences user_data = await SharedPreferences.getInstance();
    setState(() {
      User_id = user_data.getString("user_id");
    });
  }

  var User_id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Students_register")
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

          final student_detail = snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 110.h,
                        width: 412.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                                        AssetImage("assets/images/father.jpg"),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Row(
                                        children: [
                                          Text(
                                            "Hello",
                                            style: GoogleFonts.poppins(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 205.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Student_Notificationview();
                                                },
                                              ));
                                            },
                                            child:
                                            badges.Badge(
                                              backgroundColor:
                                                  Color(0xff23ADB4),
                                              label: Text("1"),
                                              isLabelVisible: true,
                                              child: SvgPicture.asset(
                                                "assets/icons/lets-icons_bell-light.svg",
                                                width: 30.w,
                                                color: Colors.black,
                                              ),
                                            ),
                                            // Stack(
                                            //   clipBehavior: Clip.none,
                                            //   children: [
                                            //     const Icon(Icons.notifications, size:30),
                                            //     if(count >0)
                                            //       Positioned(
                                            //         right: -2,
                                            //           top: -2,
                                            //           child: Container(
                                            //             padding: const EdgeInsets.all(4),
                                            //             decoration: const BoxDecoration(
                                            //               color: Colors.red,
                                            //               shape: BoxShape.circle
                                            //             ),
                                            //             constraints: const BoxConstraints(minHeight: 18,minWidth:18 ),
                                            //             child: Center(
                                            //               child: Text('$count',style:const TextStyle(color: Colors.white,fontSize: 10) ,),
                                            //             ),
                                            //           ))
                                            //   ],
                                            // )

                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            student_detail["Gaurdian_Name"] ??
                                                "No data found",
                                            style: GoogleFonts.poppins(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
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
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150.h,
                        width: 390.w,
                        decoration: BoxDecoration(
                            color: Color(0xff23ADB4),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/Max.png"),
                                    radius: 30.r,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Student Details",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              student_detail["First_Name"] ??
                                                  "No data found",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Student ID : ${student_detail["ID"] ?? "No data found"}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Class : ${student_detail["Class"] ?? "No data found"}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
                              return Student_Exams();
                            },
                          ));
                        },
                        child: Container(
                          height: 175.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xff23ADB4)),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/exam_icon.svg",
                                    width: 70.w,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Exams",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: Color(0xff23ADB4)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Student_Homeworks();
                            },
                          ));
                        },
                        child: Container(
                          height: 175.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xff23ADB4)),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/books.svg",
                                    width: 70.w,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Homeworks",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: Color(0xff23ADB4)),
                                    )
                                  ],
                                ),
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
                              return Teachers_InfoRating();
                            },
                          ));
                        },
                        child: Container(
                          height: 175.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xff23ADB4)),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/teacher_icon.svg",
                                    width: 70.w,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Teachers",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: Color(0xff23ADB4)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Student_Resultpage();
                            },
                          ));
                        },
                        child: Container(
                          height: 175.h,
                          width: 175.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xff23ADB4)),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/result_icon.svg",
                                    width: 70.w,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Results",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp,
                                          color: Color(0xff23ADB4)),
                                    )
                                  ],
                                ),
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
        });
  }
}
