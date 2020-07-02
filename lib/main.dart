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
        'Black',
        'Red',
        'Green',
        'White',
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        'Rabbit',
        'Horse',
        'Elephant',
        'Lion',
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        'Hamburger',
        'Sushi',
        'A Fresh Sallad',
        'Pizza',
      ]
    },
  ];

  var _questionsIndex = 0;

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
