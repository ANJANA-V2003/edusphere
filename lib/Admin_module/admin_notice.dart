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
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getdata();
  // }
  //
  // Future<void> getdata() async {
  //   SharedPreferences notice_data = await SharedPreferences.getInstance();
  //   setState(() {
  //     Notice_id = notice_data.getString("notice_id");
  //     print("$Notice_id//////////////////////////////////////");
  //   });
  // }
  //
  // var Notice_id;
  final form_key = GlobalKey<FormState>();
  late String notice_id = "";

  final title_controller = TextEditingController();
  final details_controller = TextEditingController();
  final date_controller = TextEditingController();

  Future<String> notice() async {
    DocumentReference docref =
        await FirebaseFirestore.instance.collection("Admin_Notices").add({
      "Title": title_controller.text,
      "Details": details_controller.text,
      "Date": date_controller.text,
    });
    String notice_id = docref.id;
    print("$notice_id/////////////");
    await docref.update({"Notice_id": notice_id});

    Navigator.of(context).pop();
    return notice_id;
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
  // late String notice_id;

  void addNoticeAndLoad() async {
    notice_id = await notice(); // Now you have access to it
    setState(() {}); // Rebuild widget to use the ID in StreamBuilder
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
            FirebaseFirestore.instance.collection("Admin_Notices").snapshots(),
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
                                fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    GestureDetector(
                      onTap: () {
                        // Get the current notice data from Firestore
                        var noticeData = notices[index];

                        // Show a dialog with the current data pre-filled
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController titleController =
                                TextEditingController(
                                    text: noticeData["Title"]);
                            TextEditingController detailsController =
                                TextEditingController(
                                    text: noticeData["Details"]);
                            TextEditingController dateController =
                                TextEditingController(text: noticeData["Date"]);

                            return AlertDialog(
                              title: Text("Update Notice"),
                              content: SizedBox(
                                height:
                                    250.0, // Adjust the height based on your form
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: "Enter title",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      controller: detailsController,
                                      decoration: InputDecoration(
                                        hintText: "Enter details",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      controller: dateController,
                                      decoration: InputDecoration(
                                        hintText: "Enter date (dd/mm/yyyy)",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Get the new values from the controllers
                                    String updatedTitle = titleController.text;
                                    String updatedDetails =
                                        detailsController.text;
                                    String updatedDate = dateController.text;

                                    // Update the Firestore document with new data
                                    FirebaseFirestore.instance
                                        .collection("Admin_Notices")
                                        .doc(noticeData[
                                            "Notice_id"]) // Use the unique Notice_id to reference the document
                                        .update({
                                      "Title": updatedTitle,
                                      "Details": updatedDetails,
                                      "Date": updatedDate,
                                    }).then((_) {
                                      // Optionally, show a success message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Notice updated successfully!"),
                                        duration: Duration(seconds: 2),
                                      ));
                                    }).catchError((error) {
                                      // Handle any errors
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Error updating notice: $error"),
                                        duration: Duration(seconds: 2),
                                      ));
                                    });

                                    Navigator.of(context)
                                        .pop(); // Close the dialog after updating
                                  },
                                  child: Text("Update"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: SvgPicture.asset(
                          "assets/icons/edit_icon.svg",
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection("Admin_Notices")
                            .where("Notice_id",
                                isEqualTo: notices[index]["Notice_id"])
                            .get()
                            .then((querySnapshot) {
                          for (var doc in querySnapshot.docs) {
                            doc.reference.delete();
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: SvgPicture.asset(
                          "assets/icons/delete_icon.svg",
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                  ],
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
