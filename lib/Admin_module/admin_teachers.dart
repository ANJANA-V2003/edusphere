import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Admin_module/admin_teacher-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Teachers extends StatefulWidget {
  const Admin_Teachers({super.key});

  @override
  State<Admin_Teachers> createState() => _Admin_TeachersState();
}

//sorting left
class _Admin_TeachersState extends State<Admin_Teachers> {
  int selectedCategory = 0;

  final List<String> categories = [
    "All",
    "Science",
    "Social",
    "Math",
    "English"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: ChoiceChip(
                  checkmarkColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  label: Text(
                    categories[index],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                  ),
                  selected: selectedCategory == index,
                  selectedColor: Color(0xff23ADB4),
                  backgroundColor: Color(0xffA3F2F7),
                  onSelected: (_) => setState(() => selectedCategory = index),
                ),
              ),
            ),
          ),
          StreamBuilder(
            // stream: FirebaseFirestore.instance
            //     .collection("Teachers_register")
            //     .snapshots(),
               stream:selectedCategory == 0
                  ? FirebaseFirestore.instance
                  .collection("Teachers_register")
               .where("Status",isNotEqualTo: 2)
                  .snapshots()
                  : FirebaseFirestore.instance
                  .collection("Teachers_register")
                  .where("Subject", isEqualTo: categories[selectedCategory])
               .where("Status",isEqualTo: 1)
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

              var Teachers_datas = snapshot.data!.docs;

              print("Selected Category: ${categories[selectedCategory]}");
              for (var doc in Teachers_datas) {
                print("Teacher: ${doc['Name']} - Subject: ${doc['Subject']} - Status: ${doc['Status']}");
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: Teachers_datas.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Admin_Teacher_details(
                                id: Teachers_datas[index].id);
                          },
                        ));
                      },
                      child: Container(
                        width: 380.w,
                        height: 70.h,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.w, color: Colors.grey.shade400),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundImage:NetworkImage(Teachers_datas[index]["Profile_path"]),
                                    ),
                            SizedBox(width: 10.w),
                            Expanded(
                                child: Text(Teachers_datas[index]["Name"],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500))),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
