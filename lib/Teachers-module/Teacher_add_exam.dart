import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher_AddExam extends StatefulWidget {
  const Teacher_AddExam({super.key});

  @override
  State<Teacher_AddExam> createState() => _Teacher_AddExamState();
}

class _Teacher_AddExamState extends State<Teacher_AddExam> {

  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  Future<void> getdatas() async {
    SharedPreferences teacher_data= await SharedPreferences.getInstance();
    setState(() {
      User_id = teacher_data.getString("user_id");
    });
  }

  var User_id;
  String? selectedClass;
  final TextEditingController exmNameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  // final TextEditingController questionController = TextEditingController();
  // final TextEditingController answerController = TextEditingController();
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

  Future<void> add_exam() async {
    if (exmNameController.text.isEmpty ||
        durationController.text.isEmpty ||
        // questionController.text.isEmpty ||
        // answerController.text.isEmpty ||
        selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection("Teacher_exams").add({
        "Name": exmNameController.text,
        "Duration": durationController.text,
        "Date": Timestamp.fromDate(DateTime(selectedDate!.year,selectedDate!.month,selectedDate!.day)),
        "Class": selectedClass,
        "Topic": topicController.text,
        'Teacher_id': User_id,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exam details added successfully")),
      );

      Navigator.pop(context);
    } catch (e) {ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to add the exam details: \$e")),
    );}
  }

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
            ), SizedBox(height: 16.h),
            TextFormField(
              controller: topicController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Topic',
              ),
            ),
            SizedBox(height: 150.h),
            // Container(
            //   padding: EdgeInsets.all(10.r),
            //   decoration: BoxDecoration(
            //     color: Color(0xffD9D9D9),
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10.r),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Questions',
            //           style: GoogleFonts.poppins(
            //               fontWeight: FontWeight.bold, fontSize: 18.sp)),
            //       SizedBox(height: 8.h),
            //       TextFormField(
            //         controller: questionController,
            //         decoration: InputDecoration(
            //           fillColor: Colors.white,
            //           filled: true,
            //           border: OutlineInputBorder(),
            //           labelText: 'Enter question',
            //         ),
            //       ),
            //       SizedBox(height: 10.h),
            //       TextFormField(
            //         controller: answerController,
            //         decoration: InputDecoration(
            //           fillColor: Colors.white,
            //           filled: true,
            //           border: OutlineInputBorder(),
            //           labelText: 'Enter answer',
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 180.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: add_exam,
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
      ),
    );
  }
}
