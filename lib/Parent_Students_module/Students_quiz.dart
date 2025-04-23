import 'package:edushpere/Parent_Students_module/student_quiz_questions.dart';
import 'package:flutter/material.dart';

class StudentsQuiz extends StatefulWidget {
  const StudentsQuiz({super.key});

  @override
  State<StudentsQuiz> createState() => _StudentsQuizState();
}

class _StudentsQuizState extends State<StudentsQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Daily Quiz", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text("10 Questions · 50 Points"),
          const SizedBox(height: 10),
          const Text("The Daily Quiz tests your understanding of key concepts."),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => Student_QuizQuestions(currentIndex: 0)));
            },
            child: const Text("Start"),
          ),
        ],
      ),
    ),);
  }
}
