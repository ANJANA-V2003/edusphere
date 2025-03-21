import 'dart:async';

import 'package:edushpere/Admin_module/admin_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo_Splashscreen_admin extends StatefulWidget {
  const Logo_Splashscreen_admin({super.key});

  @override
  State<Logo_Splashscreen_admin> createState() => _Logo_Splashscreen_adminState();
}

class _Logo_Splashscreen_adminState extends State<Logo_Splashscreen_admin> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Admin_Login();
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
