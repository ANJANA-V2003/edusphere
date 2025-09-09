import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Events extends StatefulWidget {
  const Teacher_Events({super.key});

  @override
  State<Teacher_Events> createState() => _Teacher_EventsState();
}

class _Teacher_EventsState extends State<Teacher_Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Admin_Notices")
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

                var notice = snapshot.data!.docs;

                return Expanded(
                  child: ListView.builder(
                    itemCount: notice.length,
                    itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                      child: Container(
                        width: 380.w,
                        height: 130.h,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.w, color: Colors.grey.shade400),
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 80.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/event.png"),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: Text(
                                              notice[index]["Title"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.w,
                                          ),
                                          child: Text(notice[index]["Details"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Text(notice[index]["Date"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff0B99A0))),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
