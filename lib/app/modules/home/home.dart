import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                height: 350,
                color: Theme.of(context).colorScheme.primary,
              ),
              // Opacity(
              //   opacity: 0.7,
              //   child: Image.asset(
              //     'assets/images/quiz-logo.png',
              //     height: 350,
              //   ),
              // ),

              const SizedBox(
                height: 60,
              ),

              const Text(
                'Learn Flutter the Fun way',
                style: TextStyle(
                  fontSize: 25,
                  // fontStyle: FontStyle.italic,
                  // color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              OutlinedButton.icon(
                onPressed: startQuiz,
                // style: OutlinedButton.styleFrom(
                //   foregroundColor: Colors.white,
                // ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                ),
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 25,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Home',
                child: Text('Home'),
              ),
              const PopupMenuItem(
                value: 'Profile',
                child: Text('Profile'),
              ),
            ],
            onSelected: (newValue) {},
          ),
        ),
      ],
    );
  }
}
