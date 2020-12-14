import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 5},
        {'text': 'White', 'score': 0}
      ],
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Frog', 'score': 4},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 3},
        {'text': 'Turtle', 'score': 5}
      ],
    },
    {
      'questionText': 'What programming language do you like the most?',
      'answers': [
        {'text': 'Java', 'score': 10},
        {'text': 'Python', 'score': 4},
        {'text': 'C#', 'score': 6},
        {'text': 'Ruby', 'score': 9}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
