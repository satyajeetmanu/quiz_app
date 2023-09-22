import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.onRestart, {super.key});

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i].text,
          'selectedAnswer': selectedAnswers[i],
          'correctAnswer': questions[i].answers[0],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectAnwers = summaryData.where((item) {
      return item['selectedAnswer'] == item['correctAnswer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnwers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 50),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 1, 112),
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
