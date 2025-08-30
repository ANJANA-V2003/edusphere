import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Admin_module/admin_add_timetable.dart';
import 'package:edushpere/Admin_module/admin_update_timetable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Timetable extends StatefulWidget {
  const Admin_Timetable({super.key});

  @override
  State<Admin_Timetable> createState() => _Admin_TimetableState();
}

class _Admin_TimetableState extends State<Admin_Timetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Time table",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Admin_Timetable")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); //loading action , shows that data is
            }

            if (!snapshot.hasData) {
              // to check if there is data if not it returns the text
              return Center(child: Text("No data found"));
            }

            var data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                  child: Container(
                    width: 380.w,
                    height: 70.h,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: Colors.grey.shade400),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 40.w),
                        Expanded(
                            child: Text("Class ${data[index]["Class"]}",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600))),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Admin_UpdateTimetable(
                                  docId: data[index].id,
                                  timetableData: data[index].data(),
                                );
                              },
                            )),
                            child: SvgPicture.asset(
                              "assets/icons/edit_icon.svg",
                              height: 19.h,
                              width: 19.w,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: SvgPicture.asset(
                            "assets/icons/delete_icon.svg",
                            height: 19.h,
                            width: 19.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        backgroundColor: Color(0xff23ADB4),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Admin_AddTimetable(),
            )),
      ),
    );
  }
}
