import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, {super.key});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i],
          'selectedAnswer': selectedAnswers[i],
          'correctAnswer': questions[i].answers[0],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered X out of Y questions correctly!'),
            SizedBox(height: 30),
            Text('List of selected answers and correct answers'),
            SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {},
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
