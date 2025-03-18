import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Message extends StatefulWidget {
  const Teacher_Message({super.key});

  @override
  State<Teacher_Message> createState() => _Teacher_MessageState();
}

class _Teacher_MessageState extends State<Teacher_Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Message',
        style:
            GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.w600),
      ),
    ),
      body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        child: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return Teacher_AttendeesReview();
            //   },
            // ));
          },
          child: Container(
            width: 380.w,
            height: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(width: 2.w, color: Colors.grey.shade400),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Elsa.png")),
                SizedBox(width: 30.w),
                Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Elsa",
                                style: GoogleFonts.poppins(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Class 1",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff757575))),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
