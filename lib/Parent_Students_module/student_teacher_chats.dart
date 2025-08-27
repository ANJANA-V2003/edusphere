import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Student_TeacherChats extends StatefulWidget {
  const Student_TeacherChats({super.key});

  @override
  State<Student_TeacherChats> createState() => _Student_TeacherChatsState();
}

class _Student_TeacherChatsState extends State<Student_TeacherChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Chats',
        style:
        GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
      ),
    ),body:  ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: GestureDetector(onTap: () {
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return Teachers_Rating();
          //   },
          // ));
        },
          child: Container(
            width: 380.w,
            height: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.grey.shade400),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                SizedBox(width: 20.w),
                CircleAvatar(
                    backgroundImage: AssetImage("assets/images/catherine.png")),
                SizedBox(width: 10.w),
                Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10.w),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Catherine",
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text("Math Teacher",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,color: Color(0xff706969),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
