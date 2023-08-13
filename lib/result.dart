import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetHandler;
  final int resultScore;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 70) {
      resultText = 'Not too bad!';
    } else if (resultScore <= 130) {
      resultText = 'Nice choices';
    } else if (resultScore <= 150) {
      resultText = 'Perfect Score';
    } else {
      resultText = 'How can you be this bad!?';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              child: Text("Restart the Quiz!!"),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: const BorderSide(
                    width: 4,
                    color: Colors.greenAccent,
                  )),
              onPressed: resetHandler,
            )
          ],
        ),
      ),
    );
  }
}
