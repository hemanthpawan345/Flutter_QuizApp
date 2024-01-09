import 'package:flutter/material.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:myapp_2/home.dart';
import 'package:myapp_2/questions_page.dart';
import 'package:myapp_2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = 'Home-Page';
  List<String> selectedAnswers = [];
  void swithState() {
    setState(() {
      activeScreen = 'Question-Page';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'Result-Page';
      });
    }
  }

  void reStart(){
    selectedAnswers=[];
    setState(() {
      activeScreen='Home-Page';
    });
  }
  @override
  Widget build(context) {
    Widget screenWidget = HomePage(swithState);

    if (activeScreen == 'Question-Page') {
      screenWidget = QuestionPage(
        onSelectAnswer: selectAnswer,
      );
    } else if (activeScreen == 'Result-Page') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onReStart: reStart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 164, 159, 177),
                Color.fromARGB(255, 95, 90, 108),
              ],
              radius: 1,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
