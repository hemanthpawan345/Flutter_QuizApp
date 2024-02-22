import 'package:flutter/material.dart';
import 'package:myapp_2/app/data/questions.dart';
import 'package:myapp_2/app/modules/question/widgets/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionPage> createState() {
    return _QuestionPage();
  }
}

class _QuestionPage extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          child: Opacity(
            opacity: 0.2,
            child: SizedBox(
              height: 400,
              child: Image.asset(
                'assets/images/quiz-logo.png',
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentQuestion.question,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ...currentQuestion.getShuffledAnswers().map(
                  (answer) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AnswerButton(
                          text: answer,
                          onTap: () {
                            answerQuestion(answer);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
