import 'package:edushpere/Admin_module/admin_notice.dart';
import 'package:edushpere/Admin_module/admin_students.dart';
import 'package:edushpere/Admin_module/admin_teachers.dart';
import 'package:edushpere/Admin_module/admin_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({super.key});

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff23ADB4), // Set full background color
        child: Column(
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff23ADB4)),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Edu",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sphere",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView(
                children: [
                  drawerItem(Icons.home, "Home", context, Admin_Home()),
                  drawerItem(Icons.school, "Teachers", context, Admin_Home()),
                  drawerItem(Icons.people, "Students", context, Admin_Home()),
                  drawerItem(Icons.article, "Notice", context, Admin_Home()),
                  drawerItem(Icons.person, "Profile", context, Admin_Home()),
                  drawerItem(Icons.logout, "Sign out", context, Admin_Home()),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60.w),
            Text(
              "Edu",
              style: GoogleFonts.poppins(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            Text(
              "Sphere",
              style: GoogleFonts.poppins(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xff23ADB4),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/🦆 icon _list rich_.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      // Body Content
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Admin_Teachers();
                  },
                ));
              },
              child: Container(
                height: 130.h,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Teachers",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20.h,
                      width: 10.w,
                    ),
                    Text("100",
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Admin_Teachers();
                  },
                ));
              },
              child: Container(
                height: 130.h,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Students",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20.h,
                      width: 10.w,
                    ),
                    Text("250",
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Admin_Teachers();
                  },
                ));
              },
              child: Container(
                height: 130.h,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Time Table",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Admin_Teachers();
                  },
                ));
              },
              child: Container(
                height: 130.h,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("Notice",
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to create drawer items
Widget drawerItem(
    IconData icon, String title, BuildContext context, Widget page) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500)),
    tileColor: Color(0xff23ADB4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
  );
}
