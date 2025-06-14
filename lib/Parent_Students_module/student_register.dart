import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edushpere/Parent_Students_module/parents_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Register extends StatefulWidget {
  const Student_Register({super.key});

  @override
  State<Student_Register> createState() => _Student_RegisterState();
}

class _Student_RegisterState extends State<Student_Register> {
  final form_key = GlobalKey<FormState>();

  final fnamectrl = TextEditingController();
  final lnamectrl = TextEditingController();
  final agectrl = TextEditingController();
  final numctrl = TextEditingController();
  final placectrl = TextEditingController();
  final stdnt_idctrl = TextEditingController();
  final dateController = TextEditingController();
  final gardiannamectrl = TextEditingController();
  final classctrl = TextEditingController();

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = "${picked.toLocal()}".split(' ')[0]; // Format YYYY-MM-DD
      dateController.text = formattedDate; // Update the TextField
    }
  }

  Future<void> student_data() async {
    if (form_key.currentState!.validate()) {
      FirebaseFirestore.instance.collection("Students_register").add({
        "First_Name": fnamectrl.text,
        "Last_Name": lnamectrl.text,
        "Gaurdian_Name": gardiannamectrl.text,
        "Date_of_Birth": dateController.text,
        "Phone": numctrl.text,
        "Age": agectrl.text,
        "ID": stdnt_idctrl.text,
        "Place": placectrl.text,
        "Class": classctrl.text,
        "Profile_path":
        "https://th.bing.com/th/id/OIP.A1JjNu8jIRxaTJHbD_EtFwHaIJ?rs=1&pid=ImgDetMain"
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("student_class", classctrl.text);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return Parents_Login();
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Account Created Successfully'),
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text(
          "Student Registration",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                child: TextFormField(
                  controller: fnamectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty first name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "First Name",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: lnamectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty last name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Last Name",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: gardiannamectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty guardian name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Gaurdian Name",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(filled: true,
                    fillColor: Color(0xffFFF8F8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    labelText: 'Date of birth',
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 15.sp, fontWeight: FontWeight.w600),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  controller: dateController
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: agectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty age";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Age",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ), Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: classctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty class";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Class",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: stdnt_idctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Student ID",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: placectrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Place";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Place",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 35.h),
                child: TextFormField(
                  controller: numctrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffFFF8F8),
                      filled: true,
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8.r),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80.h),
                    child: GestureDetector(
                      onTap:() => student_data(),
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            color: Color(0xff23ADB4),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
