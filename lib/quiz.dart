import 'package:flutter/material.dart';

import './answers.dart';
import './quesions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.answerQuestion,
      required this.questionIndex,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question((questions[questionIndex]['questionText'] as String)),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            answer['text'] as String,
            () => answerQuestion(answer['score']),
          );
        }).toList()
      ],
    );
  }
}
