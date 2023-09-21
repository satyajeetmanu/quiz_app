import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: item['selectedAnswer'] == item['correctAnswer']
                            ? const Color.fromARGB(255, 36, 170, 187)
                            : const Color.fromARGB(255, 234, 88, 88)),
                    child: Text(
                      ((item['index'] as int) + 1).toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(item['selectedAnswer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 234, 88, 88),
                              fontSize: 14,
                            )),
                        const SizedBox(height: 2),
                        Text(item['correctAnswer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 36, 170, 187),
                              fontSize: 14,
                            )),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
