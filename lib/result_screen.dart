import 'package:flutter/material.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:myapp_2/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onReStart,
  });
  final List<String> chosenAnswers;
  final Function() onReStart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answer[0],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answerd $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                shadows: [
                    Shadow(
                      offset: Offset(2.0, 10.0),
                      blurRadius: 10.0,
                      color: Colors.black38, // Adjust color as needed
                    ),
                  ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onReStart,
              child: const Text(
                'Restart Text',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 10.0),
                      blurRadius: 10.0,
                      color: Colors.black38, // Adjust color as needed
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
