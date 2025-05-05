import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Admin_Notice extends StatefulWidget {
  const Admin_Notice({super.key});

  @override
  State<Admin_Notice> createState() => _Admin_NoticeState();
}

class _Admin_NoticeState extends State<Admin_Notice> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    SharedPreferences notice_data = await SharedPreferences.getInstance();
    setState(() {
      Notice_id = notice_data.getString("notice_id");
      print("$Notice_id//////////////////////////////////////");
    });
  }

  var Notice_id;
  final form_key = GlobalKey<FormState>();

  final title_controller = TextEditingController();
  final details_controller = TextEditingController();
  final date_controller = TextEditingController();

  Future<void> notice() async {
    FirebaseFirestore.instance.collection("Admin_Notices").add({
      "Title": title_controller.text,
      "Details": details_controller.text,
      "Date": date_controller.text,
      "Notice_id":Notice_id
    });
    Navigator.of(context).pop();
  }

  void _showAlertDialog(BuildContext context) {
    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      titleTextStyle: GoogleFonts.poppins(
          color: Color(0xff23ADB4),
          fontSize: 20.sp,
          fontWeight: FontWeight.w500),
      title: Text("Create a notice"),
      content: SizedBox(
        height: 300,
        child: Form(
          key: form_key,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Title",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: TextFormField(
                  controller: title_controller,
                  decoration: InputDecoration(
                      fillColor: Color(0xffA39C9C),
                      filled: true,
                      hintText: "Enter title",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r)))),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Details",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: TextFormField(
                  controller: details_controller,
                  decoration: InputDecoration(
                      fillColor: Color(0xffA39C9C),
                      filled: true,
                      hintText: "Enter details",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r)))),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Date",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: TextFormField(
                  controller: date_controller,
                  decoration: InputDecoration(
                      fillColor: Color(0xffA39C9C),
                      filled: true,
                      hintText: "dd/mm/yyyy",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r)))),
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text("Save"),
          onPressed: () => notice(),
        ),
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        title: Text("Notices",
            style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff23ADB4),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("Admin_Notices").where("Notice_id", isEqualTo: Notice_id).snapshots(),
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

          var notices = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notices.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Admin_Student_details();
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
                      Container(
                        height: 40.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: AssetImage("assets/images/event.png"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 40.w),
                      Expanded(
                          child: Text(notices[index]["Title"],
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: IconButton(onPressed: () {
                          FirebaseFirestore.instance
                              .collection("Admin_Notices")
                              .doc(notices[index]
                              .id)
                              .delete();
                        },
                          icon: SvgPicture.asset(
                            "assets/icons/edit_icon.svg",
                            height: 19.h,
                            width: 19.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: SvgPicture.asset(
                          "assets/icons/delete_icon.svg",
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        backgroundColor: Color(0xff23ADB4),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp,
        ),
        onPressed: () => _showAlertDialog(context),
      ),
    );
  }
}
