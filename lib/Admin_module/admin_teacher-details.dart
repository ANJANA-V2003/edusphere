import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Teacher_details extends StatefulWidget {
  const Admin_Teacher_details({super.key, required this.id});
  final id;

  @override
  State<Admin_Teacher_details> createState() => _Admin_Teacher_detailsState();
}

class _Admin_Teacher_detailsState extends State<Admin_Teacher_details> {
  Future<void> select_accept() async {
    FirebaseFirestore.instance
        .collection("Teachers_register")
        .doc(widget.id)
        .update({"Status": 1});
    Navigator.pop(context);
  }

  Future<void> select_reject() async {
    FirebaseFirestore.instance
        .collection("Teachers_register")
        .doc(widget.id)
        .update({"Status": 2});
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Teachers",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Teachers_register")
            .doc(widget.id)
            .get(),builder: (context, snapshot) {
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

        final Teacher_datas = snapshot.data!.data() as Map<String, dynamic>;

        return Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Column(
            children: [
              // Profile Image
              CircleAvatar(
                radius: 45.r,
                backgroundImage: NetworkImage(
                    Teacher_datas["Profile_path"] ?? "No data found"),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(height: 10),
              // Student Name
              Text(
                Teacher_datas["Name"] ?? "No data found",
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Container(
                  height: 370.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: Color(0xffD4F6F8),
                      borderRadius: BorderRadius.all(Radius.circular(12.r))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            Text("Experience :",
                                style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 38.w,
                            ),
                            Text(Teacher_datas["Experience"] ?? "No data found",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            Text("Subject :",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 75.w,
                            ),
                            Text(Teacher_datas["Subject"] ?? "No data found",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            Text("Age :",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 110.w,
                            ),
                            Text(Teacher_datas["Age"] ?? "No data found",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            Text("Place :",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 90.w,
                            ),
                            Text(Teacher_datas["Place"] ?? "No data found",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            Text("Phone :",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 70.w,
                            ),
                            Text(Teacher_datas["Phone"] ?? "No data found",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 45.h),
              Teacher_datas["Status"] == 0?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {select_accept();},
                    child: Container(
                      height: 45.h,
                      width: 150.w,
                      decoration: BoxDecoration(color: Color(0xff09AEAE),
                          border:
                          Border.all(color: Color(0xff09AEAE), width: 2.w),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text(
                          "Accept",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 18.sp,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {select_reject();},
                    child: Container(
                      height: 45.h,
                      width: 150.w,
                      decoration: BoxDecoration(

                          border:
                          Border.all(color: Color(0xff09AEAE), width: 2.w),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text(
                          "Reject",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  :Teacher_datas["Status"] == 2?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5.r),
                        color: Colors.red
                      // Color(0xff73ABFF)
                    ),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              "Rejected",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
                  :SizedBox.shrink()
            ],
          ),
        );
            },

      ),
    );
  }
}
