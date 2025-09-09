import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Teachers-module/Teacher_add_exam.dart';
import 'package:edushpere/Teachers-module/Teacher_exam_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_Examview extends StatefulWidget {
  const Teacher_Examview({super.key});

  @override
  State<Teacher_Examview> createState() => _Teacher_ExamviewState();
}

class _Teacher_ExamviewState extends State<Teacher_Examview> {
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
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Exams Details',
          style:
              GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            child: DropdownButtonFormField<String>(
              value: selectedClass,
              onChanged: (String? newValue) {
                setState(() {
                  selectedClass = newValue;
                });
              },
              items: ['1', '2', '3', '4', '5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select the class',
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: selectedClass == null
                  ? FirebaseFirestore.instance
                      .collection("Teacher_exams")
                      .where("Teacher_id", isEqualTo: User_id)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("Teacher_exams")
                      .where("Teacher_id", isEqualTo: User_id)
              .where("Class",isEqualTo: selectedClass)
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

                var exams = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: Container(
                      width: 380.w,
                      height: 200.h,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.w, color: Colors.grey.shade400),
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                                child: Text(exams[index]['Name'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700)),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(right: 10.w, top: 5.h),
                              //   child: Text("Due : 17-03-2025",
                              //       style: GoogleFonts.poppins(
                              //           fontSize: 16.sp,
                              //           fontWeight: FontWeight.w600,
                              //           color: Color(0xff0B99A0))),
                              // ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Text(
                                  "Duration : ${exams[index]['Duration']}",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                      color: Color(0xff706969)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 15.h),
                                child: SizedBox(
                                  width: 340,
                                  child: Text(
                                    "Topic : ${exams[index]['Topic']}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: Color(0xff706969)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.only(left: 10.w, top: 5.h),
                          //       child: Text("Submitted : 5",
                          //           style: GoogleFonts.poppins(
                          //               fontSize: 18.sp,
                          //               fontWeight: FontWeight.w600)),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(context, MaterialPageRoute(
                          //           builder: (context) {
                          //             return Teacher_ExamReview();
                          //           },
                          //         ));
                          //       },
                          //       child: Container(
                          //         height: 45.h,
                          //         width: 150.w,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20.r),
                          //             color: Color(0xff23ADB4)),
                          //         child: Center(
                          //           child: Text(
                          //             "Open",
                          //             style: GoogleFonts.poppins(
                          //                 fontWeight: FontWeight.w600,
                          //                 fontSize: 18.sp,
                          //                 color: Colors.white),
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xff23ADB4),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Teacher_AddExam();
            },
          ));
        },
      ),
    );
  }
}
