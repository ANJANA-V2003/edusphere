import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Student_details extends StatefulWidget {
  const Admin_Student_details({super.key, required this.id});
  final id;

  @override
  State<Admin_Student_details> createState() => _Admin_Student_detailsState();
}

class _Admin_Student_detailsState extends State<Admin_Student_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Students",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Students_register")
            .doc(widget.id)
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

          final student_datas = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Column(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 45.r,
                  backgroundImage: AssetImage(
                      "assets/images/Elsa.png"), // Replace with actual image path
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 10),
                // Student Name
                Text(
                  student_datas["First_Name"] ?? "No data found",
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Container(
                    height: 400.h,
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
                              Text("Guardian :",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 33.w,
                              ),
                              Text(student_datas["Gaurdian_Name"] ?? "No data found",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Text("Class :",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 75.w,
                              ),
                              Text(student_datas["Class"] ?? "No data found",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 90.w,
                              ),
                              Text("${student_datas["Age"]?? "No data found"} years",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 63.w,
                              ),
                              Text(student_datas["Phone"] ?? "No data found",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 70.w,
                              ),
                              Text(student_datas["Place"] ?? "No data found",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
