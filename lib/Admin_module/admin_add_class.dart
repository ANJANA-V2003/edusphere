import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAddClass extends StatefulWidget {
  const AdminAddClass({super.key});

  @override
  State<AdminAddClass> createState() => _AdminAddClassState();
}

class _AdminAddClassState extends State<AdminAddClass> {
  final TextEditingController classNameCtrl = TextEditingController();

  String? selectedTeacherId;
  String? selectedTeacherName;

  Future<void> addClass() async {
    if (classNameCtrl.text.isEmpty || selectedTeacherId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please enter class name and select teacher")),
      );
      return;
    }

    final firestore = FirebaseFirestore.instance;

    await firestore.collection("Classes").doc(classNameCtrl.text).set({
      "classId": classNameCtrl.text,
      "className": "Class ${classNameCtrl.text}",
      "teacherId": selectedTeacherId,
      "teacherName": selectedTeacherName,
      "students": [],
      "createdAt": FieldValue.serverTimestamp(),
    });

    // update teacher with assigned class
    await firestore
        .collection("Teachers_register")
        .doc(selectedTeacherId)
        .update({
      "assignedClass": classNameCtrl.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Class added successfully")),
    );

    classNameCtrl.clear();
    setState(() {
      selectedTeacherId = null;
      selectedTeacherName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Class")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // class name input
            TextField(
              controller: classNameCtrl,
              decoration: const InputDecoration(
                labelText: "Class Name / ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // teacher dropdown
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Teachers_register")
                  .where("Status", isEqualTo: 1)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                var teachers = snapshot.data!.docs;

                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Select Teacher",
                  ),
                  value: selectedTeacherId,
                  items: teachers.map((doc) {
                    return DropdownMenuItem<String>(
                      value: doc.id,
                      child: Text(doc["Name"]),
                      onTap: () {
                        selectedTeacherName = doc["Name"];
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTeacherId = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: addClass,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text("Add Class"),
            )
          ],
        ),
      ),
    );
  }
}
