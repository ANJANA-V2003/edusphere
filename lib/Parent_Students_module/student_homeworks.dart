import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Homeworks extends StatefulWidget {
  const Student_Homeworks({super.key});

  @override
  State<Student_Homeworks> createState() => _Student_HomeworksState();
}

class _Student_HomeworksState extends State<Student_Homeworks> {
  String? studentClass;

  @override
  void initState() {
    super.initState();
    loadClass();
  }

  Future<void> loadClass() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedClass = prefs.getString("student_class");
    print("//////Loaded student class: $loadedClass"); // <-- DEBUG
    setState(() {
      studentClass = loadedClass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homework',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: studentClass == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Teacher_Homeworks")
                        .where("class", isEqualTo: studentClass)
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

                      var homework = snapshot.data!.docs;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: homework.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 15.h),
                            child: Container(
                              width: 380.w,
                              height: 150.h,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: Colors.grey.shade400),
                                color: Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Text(homework[index]["Subject"],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, top: 5.h),
                                        child: Text("Due:${homework[index]["date"]}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff0B99A0))),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Padding(
                                  //       padding: EdgeInsets.only(left: 10.w),
                                  //       child: Text(
                                  //         "Ms Catherine",
                                  //         style: GoogleFonts.poppins(
                                  //             fontWeight: FontWeight.w500,
                                  //             fontSize: 15.sp,
                                  //             color: Color(0xff706969)),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 20.h),
                                        child: SizedBox(
                                          width: 340.w,
                                          child: Text(
                                            homework[index]["Topic"],
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Color(0xff706969)),
                                          ),
                                        ),
                                      )
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
