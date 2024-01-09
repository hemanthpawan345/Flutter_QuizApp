import 'package:flutter/material.dart';
import 'package:myapp_2/answer_button.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8,2,8,2),
                  child: AnswerButton(
                    text: answer,
                    onTap:(){
                      answerQuestion(answer);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
