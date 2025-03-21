import 'dart:async';

import 'package:edushpere/Admin_module/admin_login.dart';
import 'package:edushpere/Teachers-module/Teacher_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen_teachers extends StatefulWidget {
  const Splashscreen_teachers({super.key});

  @override
  State<Splashscreen_teachers> createState() => _Splashscreen_teachersState();
}

class _Splashscreen_teachersState extends State<Splashscreen_teachers> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return TeacherLogin();
        },
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23ADB4),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 300.h,width: 380.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Untitled_design-removebg-preview 1.png"))
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
