import 'package:flutter/material.dart';

import 'Student_quiz_summary.dart';

class Student_QuizQuestions extends StatefulWidget {
  final int currentIndex;
  const Student_QuizQuestions({super.key, required this.currentIndex});
  // const Student_QuizQuestions({super.key});

  @override
  State<Student_QuizQuestions> createState() => _Student_QuizQuestionsState();
}

class _Student_QuizQuestionsState extends State<Student_QuizQuestions> {
  final List<Map<String, dynamic>> questions = [
    {
      'type': 'mcq',
      'question': 'If (x) is an integer, what is the value of (3x+3=15)?',
      'options': ['3', '4', '2', '5'],
      'answer': '4'
    },
    {'type': 'written', 'question': 'Write your answer for: (2x+3=11)'},
    {'type': 'upload', 'question': 'Upload file for: Solve 2x = 10'},
  ];

  final TextEditingController _writtenController = TextEditingController();

  void nextQuestion() {
    if (widget.currentIndex + 1 < questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              Student_QuizQuestions(currentIndex: widget.currentIndex + 1),
        ),
      );
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const Student_QuizSummary()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[widget.currentIndex];
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Question ${widget.currentIndex + 1} of ${questions.length}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(question['question'], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            if (question['type'] == 'mcq')
              ...List.generate(question['options'].length, (index) {
                return ListTile(
                  title: Text(question['options'][index]),
                  onTap: () => nextQuestion(),
                );
              }),
            if (question['type'] == 'written')
              Column(
                children: [
                  TextField(
                      controller: _writtenController,
                      decoration:
                          const InputDecoration(hintText: "Write your answer")),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: nextQuestion, child: const Text("Next")),
                ],
              ),
            if (question['type'] == 'upload')
              Column(
                children: [
                  const Icon(Icons.cloud_upload, size: 60),
                  const Text("Drag file to upload"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: nextQuestion, child: const Text("Next")),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
