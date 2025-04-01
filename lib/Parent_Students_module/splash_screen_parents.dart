import 'dart:async';

import 'package:edushpere/Parent_Students_module/parents_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen_Parents extends StatefulWidget {
  const SplashScreen_Parents({super.key});

  @override
  State<SplashScreen_Parents> createState() => _SplashScreen_ParentsState();
}

class _SplashScreen_ParentsState extends State<SplashScreen_Parents> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Parents_Register();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23ADB4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300.h,
                width: 380.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Untitled_design-removebg-preview 1.png"))),
              )
            ],
          )
        ],
      ),
    );
  }
}
