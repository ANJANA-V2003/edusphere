import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo_Splashscreen extends StatefulWidget {
  const Logo_Splashscreen({super.key});

  @override
  State<Logo_Splashscreen> createState() => _Logo_SplashscreenState();
}

class _Logo_SplashscreenState extends State<Logo_Splashscreen> {
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
                            "assets/Untitled_design-removebg-preview 1.png"))
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
