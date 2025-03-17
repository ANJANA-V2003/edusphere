import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Examview extends StatefulWidget {
  const Teacher_Examview({super.key});

  @override
  State<Teacher_Examview> createState() => _Teacher_ExamviewState();
}

class _Teacher_ExamviewState extends State<Teacher_Examview> {
  String? selectedClass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Exams',
          style:
              GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
              items: ['Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5']
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
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                child: Container(
                  width: 380.w,
                  height: 150.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey.shade400),
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
                            child: Text("Maths",
                                style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w, top: 5.h),
                            child: Text("Due : 17-03-2025",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff0B99A0))),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              "Ms Catherine",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Color(0xff706969)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 20.h),
                            child: SizedBox(
                              width: 340,
                              child: Text(
                                "The math assignment involves solving 20 to 23 from the school textbook.",
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
          ),
        ],
      ),
    );
  }
}
