import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_Teachers extends StatefulWidget {
  const Admin_Teachers({super.key});

  @override
  State<Admin_Teachers> createState() => _Admin_TeachersState();
}

class _Admin_TeachersState extends State<Admin_Teachers> {
  int selectedCategory = 0;

  final List<String> categories = [
    "All",
    "Science",
    "Social",
    "Math",
    "English"
  ];

  final List<Map<String, String>> teachers = [
    {"name": "Catherine", "image": "assets/avatar1.png"},
    {"name": "Debra", "image": "assets/avatar2.png"},
    {"name": "Gabriel", "image": "assets/avatar3.png"},
    {"name": "Thomas", "image": "assets/avatar4.png"},
    {"name": "Macy", "image": "assets/avatar5.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 30.sp,
                )),
            title: Text(
              "Teachers",
              style: GoogleFonts.poppins(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff23ADB4),
          ),
          body: Column(
            children: [
              // Scrollable Category Selector
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ChoiceChip(
                        label: Text(categories[index]),
                        selected: selectedCategory == index,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: teachers.length,
                  itemBuilder: (context, index) {
                    return _buildTeacherCard(teachers[index]["name"]!, teachers[index]["image"]!);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildTeacherCard(String name,String imagePath) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(imagePath)
          ),
      title: Text(name),
      trailing: Icon(Icons.more_vert),
    ),
  );
}
