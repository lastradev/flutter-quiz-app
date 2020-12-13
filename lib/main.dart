import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Red', 'Green', 'Blue', 'Pink'],
      },
      {
        'questionText': 'What\s your favorite animal?',
        'answers': ['Frog', 'Dog', 'Cat', 'Turtle'],
      },
      {
        'questionText': 'What programming language do you like the most?',
        'answers': ['Java', 'Python', 'C#', 'Ruby'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              _questions[_questionIndex]['questionText'],
            ),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList(),
          ],
        ),
      ),
    );
  }
}
