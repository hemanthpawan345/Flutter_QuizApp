import 'package:flutter/material.dart';
//import 'package:myapp_2/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
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
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Your answer : ${data['user_answer'] as String}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Correct answer : ${data['correct_answer'] as String}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
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
