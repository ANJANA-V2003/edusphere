import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Teachers-module/Teacher_add_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_Notification extends StatefulWidget {
  const Teacher_Notification({super.key});

  @override
  State<Teacher_Notification> createState() => _Teacher_NotificationState();
}

class _Teacher_NotificationState extends State<Teacher_Notification> {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher_notifications")
            .where("Teacher_id", isEqualTo: User_id)
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

          var notification= snapshot.data!.docs;

          return  Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: notification.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: Container(
                      width: 380.w,
                      height: 150.h,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.w, color: Colors.black),
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
                                child: Text(notification[index]['title'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: SizedBox(
                                  width: 340,
                                  child: Text(
                                    notification[index]['details'],
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
                                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                child: Text(notification[index]['date'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },

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
              return Teacher_AddNotification();
            },
          ));
        },
      ),
    );
  }
}
