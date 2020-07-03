import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Horse', 'score': 1},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 7},
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Hamburger', 'score': 6},
        {'text': 'Sushi', 'score': 4},
        {'text': 'A Fresh Sallad', 'score': 1},
        {'text': 'Pizza', 'score': 10},
      ]
    },
  ];

  var _questionsIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionsIndex: _questionsIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
