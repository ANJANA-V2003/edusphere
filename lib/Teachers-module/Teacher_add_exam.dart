import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_AddExam extends StatefulWidget {
  const Teacher_AddExam({super.key});

  @override
  State<Teacher_AddExam> createState() => _Teacher_AddExamState();
}

class _Teacher_AddExamState extends State<Teacher_AddExam> {
  String? selectedClass;
  final TextEditingController exmNameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
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
            SizedBox(height: 16.h),
            TextFormField(
              controller: exmNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Exam Name',
              ),
            ),
            // SizedBox(height: 16.h),
            // TextFormField(
            //   controller: quizDescriptionController,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Quiz Description',
            //   ),
            // ),
            SizedBox(height: 16.h),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Date',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              controller: TextEditingController(
                text: selectedDate == null
                    ? ''
                    : "${selectedDate!.toLocal()}".split(' ')[0],
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: durationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Duration',
              ),
            ),
            SizedBox(height: 56.h),
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Questions',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: questionController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter question',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: answerController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter answer',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 150.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                  child: Container(
                    height: 60.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                        color: Color(0xff23ADB4),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                        child: Text(
                          "Done",
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),);
  }
}
