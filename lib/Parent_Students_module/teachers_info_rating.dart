import 'package:edushpere/Parent_Students_module/Teachers_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Teachers_InfoRating extends StatefulWidget {
  const Teachers_InfoRating({super.key});

  @override
  State<Teachers_InfoRating> createState() => _Teachers_InfoRatingState();
}

class _Teachers_InfoRatingState extends State<Teachers_InfoRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      centerTitle: true,
      title: Text(
        'Teachers',
        style:
        GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    ),body:  ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Teachers_Rating();
            },
          ));
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
                SizedBox(width: 20.w),
                CircleAvatar(
                    backgroundImage: AssetImage("assets/images/catherine.png")),
                SizedBox(width: 10.w),
                Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10.w),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Catherine",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                          ),
                          Text("Math Teacher",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,color: Color(0xff706969),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
