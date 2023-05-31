import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/answerbutton.dart';
import 'package:quizapp/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<questionScreen> createState() => _questionScreenState();
}

class _questionScreenState extends State<questionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 243, 113, 255),
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
