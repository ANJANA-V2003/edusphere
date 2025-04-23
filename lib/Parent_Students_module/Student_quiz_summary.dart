import 'package:flutter/material.dart';

class Student_QuizSummary extends StatefulWidget {
  const Student_QuizSummary({super.key});

  @override
  State<Student_QuizSummary> createState() => _Student_QuizSummaryState();
}

class _Student_QuizSummaryState extends State<Student_QuizSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.emoji_events, size: 80, color: Colors.orange),
        const Text("Congratulations", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Text("You've scored 40 points!"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text("Done"),
        ),
      ]),
    ),);
  }
}
