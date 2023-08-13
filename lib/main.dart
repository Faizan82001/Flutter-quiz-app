import 'package:flutter/material.dart';
import 'package:own_quiz/quesions.dart';
import 'package:own_quiz/quiz.dart';
import './result.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': "Which along the following is your favourite anime?",
      'answers': [
        {'text': 'One Piece', 'score': 50},
        {'text': 'Bleach', 'score': 25},
        {'text': 'Naruto', 'score': 45},
        {'text': 'Your lie in April', 'score': 35},
        {'text': 'Fire force', 'score': 40},
      ]
    },
    {
      'questionText':
          "Which along the following is your favourite anime Main Character?",
      'answers': [
        {'text': 'Luffy', 'score': 40},
        {'text': 'Naruto', 'score': 50},
        {'text': 'Ichigo', 'score': 40},
        {'text': 'Goku', 'score': 35},
        {'text': 'Shinra', 'score': 45},
      ]
    },
    {
      'questionText':
          "Which along the following is your favourite side character?",
      'answers': [
        {'text': 'Zoro', 'score': 50},
        {'text': 'Sasuke', 'score': 35},
        {'text': 'Bakugo', 'score': 45},
        {'text': 'Todoroki', 'score': 30},
        {'text': 'Vegeta', 'score': 45},
      ]
    }
  ];

  void startReset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("My Quiz"),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestions,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, startReset),
    ));
  }
}
