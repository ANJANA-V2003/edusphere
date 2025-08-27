import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Notificationview extends StatefulWidget {
  const Student_Notificationview({super.key});

  @override
  State<Student_Notificationview> createState() =>
      _Student_NotificationviewState();
}

class _Student_NotificationviewState extends State<Student_Notificationview> {

  String? studentClass;

  @override
  void initState() {
    super.initState();
    loadClass();
  }

  // Future<void> loadClass() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     studentClass = prefs.getString("student_class");
  //   });
  // }

  Future<void> loadClass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedClass = prefs.getString("student_class");
    print("Loaded student class: $loadedClass"); // <-- DEBUG
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
          'Notification',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
      studentClass == null
          ? Center(child: CircularProgressIndicator())
          :
      StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Teacher_notifications")
                  .where("class", isEqualTo: studentClass)
                 // .orderBy("timestamp", descending: true) // optional
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  print("Firestore error: ${snapshot.error}");
                  return Center(child: Text("Something went wrong."));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No notifications yet."));
                }

                final notices = snapshot.data!.docs;

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: notices.length,
                        itemBuilder: (context, index) {
                          final data = notices[index].data() as Map<String, dynamic>;
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 15.h),
                            child: Container(
                              width: 380.w,
                              height: 150.h,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 2.w, color: Colors.black),
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
                                        padding:
                                        EdgeInsets.only(left: 10.w, top: 5.h),
                                        child: Text(
                                            data['title'] ?? 'No title',
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
                                            left: 10.w, top: 10.h),
                                        child: SizedBox(
                                          width: 340.w,
                                          child: Text(
                                            data['details'] ?? 'No details',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Text(data['date'] ?? 'N/A',
                                            style: GoogleFonts.poppins(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
