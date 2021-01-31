import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your one of the favorite colors?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        },
        {
          'text': 'Yellow',
          'score': 7,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 1,
        },
        {
          'text': 'Snake',
          'score': 10,
        },
        {
          'text': 'Elephant',
          'score': 3,
        },
        {
          'text': 'Lion',
          'score': 7,
        }
      ],
    },
    /*
    {
      'questionText': 'What\'s your favorite Cricket Team?',
      'answers': [
        'India',
        'Australia',
        'England',
        'Sri Lanka',
        'West Indies',
        'Bangladesh',
        'Pakistan',
        'New Zealand',
        'Zimbabve',
        'Kenya',
        'Ireland',
        'Holland',
      ],
    },*/
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print('Answer chosen');
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App!'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
