import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Timetable_Calendar extends StatefulWidget {
  const Timetable_Calendar({super.key});

  @override
  State<Timetable_Calendar> createState() => _Timetable_CalendarState();
}

class _Timetable_CalendarState extends State<Timetable_Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Admin_Timetable")
              // .where("Class",isEqualTo: ),
            .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No timetable found"));
            }

            var doc = snapshot.data!.docs.first; // each class has 1 doc
            var timetable = doc.data() as Map<String, dynamic>;

            // remove "Class" key so only time slots remain
            timetable.remove("Class");

            var timeSlots = timetable.keys.toList(); // ["9:00 am", "10:00 am", ...]
            // 🔹 Sort by time
            timeSlots.sort((a, b) {
              // Convert "9:00 am" → 9, "12:00 pm" → 12, etc.
              int to24Hour(String time) {
                final parts = time.split(" ");
                final hm = parts[0].split(":");
                int hour = int.parse(hm[0]);
                int minute = int.parse(hm[1]);

                bool isPM = parts[1].toLowerCase() == "pm";
                if (isPM && hour != 12) hour += 12;
                if (!isPM && hour == 12) hour = 0;

                return hour * 60 + minute; // return total minutes
              }

              return to24Hour(a).compareTo(to24Hour(b));
            });

            return ListView.builder(itemCount: timeSlots.length,itemBuilder: (context, index)
            {
              String time = timeSlots[index];
            String subject = timetable[time];
              return  Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                  child: Container(
                    width: 380.w,
                    height: 70.h,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.black),
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
                            Text(
                              time,
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 15.w),

                            Container(
                              height: 40.h, // increase this for more height
                              width: 2.w,   // thickness
                              color: Colors.black,
                            ),

                            // // 🔹 Vertical Divider
                            // VerticalDivider(
                            //   color: Colors.black,
                            //   thickness: 2,
                            //   width: 20, // spacing around divider
                            // ),
                            SizedBox(width: 20.w),
                            Text(
                              subject,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
            },);
          },

        )
    );
  }
}
