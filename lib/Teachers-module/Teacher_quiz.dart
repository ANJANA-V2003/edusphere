import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacher_Quiz extends StatefulWidget {
  const Teacher_Quiz({super.key});

  @override
  State<Teacher_Quiz> createState() => _Teacher_QuizState();
}

class _Teacher_QuizState extends State<Teacher_Quiz> {
  String? selectedClass;
  final TextEditingController quizNameController = TextEditingController();
  final TextEditingController quizDescriptionController =
      TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Quiz',
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
              controller: quizNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quiz Name',
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: quizDescriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quiz Description',
              ),
            ),
            SizedBox(height: 16),
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
            SizedBox(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                  child: Container(
                    height: 50.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                        color: Color(0xff23ADB4),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                        child: Text(
                      "Done",
                      style: GoogleFonts.poppins(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
