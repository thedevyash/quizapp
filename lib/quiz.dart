import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';
import './startingscreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  @override
  State<quiz> createState() {
    // TODO: implement createState
    return _quizstate();
  }
}

class _quizstate extends State<quiz> {
  List<String> selectedAnswers = [];
  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(switchScreen);
    super.initState();
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activescreen = questionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = ResultScreen(
          chosenAnswers: selectedAnswers,
          onRestart: onRestartQuiz,
        );
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 92, 10, 179),
                Color.fromARGB(255, 94, 20, 134)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activescreen),
      ),
    );
  }
}
