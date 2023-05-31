import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(108, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Welcome to flutter quiz !",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 25)),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              onPressed: startquiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
