import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({super.key});

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        //drawer is property worked only when appbar is called
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Close the drawer and navigate to the Home page
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Close the drawer and navigate to the Settings page
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                // Close the drawer and navigate to the Contact page
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Text(
                "Edu",
                style: GoogleFonts.poppins(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              Text(
                "Sphere",
                style: GoogleFonts.poppins(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
          backgroundColor: Color(
            0xff23ADB4,
          ),
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Color(0xff23ADB4),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/🦆 icon _list rich_.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
