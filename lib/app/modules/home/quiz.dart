import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp_2/app/data/questions.dart';
import 'package:myapp_2/app/modules/home/home.dart';
import 'package:myapp_2/app/controller/theme_controller.dart';
import 'package:myapp_2/app/modules/result/result_screen.dart';
import 'package:myapp_2/app/modules/question/questions_page.dart';

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

  void reStart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'Home-Page';
    });
  }

  @override
  Widget build(context) {
    var controller = Get.put(ThemeController());

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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: screenWidget,
          ),
          
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                controller.increase();
                Get.changeTheme(
                  controller.themes[controller.index],
                );
              },
              icon: Icon(
                Icons.light_mode,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
