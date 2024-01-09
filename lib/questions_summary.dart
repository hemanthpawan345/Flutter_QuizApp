import 'package:flutter/material.dart';
//import 'package:myapp_2/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Row(children: [
                    Container(
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] != data['correct_answer']
                            ? Colors.red
                            : Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Your answer : ${data['user_answer'] as String}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Correct answer : ${data['correct_answer'] as String}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
