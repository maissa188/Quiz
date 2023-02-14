import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main()=>runApp(MyApp());


class MyApp extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
  
 return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
 final _questions = const [ 
  {
        'questionText':'what\'s your favorite color ?',
        'answers':[
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 5}, 
          {'text': 'Blue', 'score': 3}, 
          {'text': 'White', 'score': 1},
        
        ],
      },
      {
        'questionText':'what\'s your favorite animal ?',
        'answers':[
          {'text':'Rabbit','score':9},
          {'text':'snake','score':2},
          {'text':'Elephant','score':6},
          {'text':'Lion','score':7},
          ],
      },
         {
        'questionText':'what\'s your favorite instructor ?',
        'answers':[
           {'text':'Max','score':5},
            {'text':'Alex','score':3},
             {'text':'Anna','score':2},
              {'text':'Mario','score':7},
          ],
           
      },
     
    ];
  var _questionIndex =0;
  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
      _questionIndex =0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score){
   _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1 ;
    });
print (_questionIndex); 
 if(_questionIndex < _questions.length){
print('We have more questions !');
    }
    else{
      print ('No more questions!');
    }
}

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      home: Scaffold(
      appBar: AppBar (
        title: const Text('Quiz App'),
         backgroundColor: Color.fromARGB(255, 50, 47, 223),
        ),
        body:Padding(padding: const EdgeInsets.all(30.0),
       child:_questionIndex < _questions.length
        ? Quiz(
           answerQuestion:_answerQuestion,
           questionIndex: _questionIndex,
           questions: _questions,
           )
        : Result(_totalScore, _resetQuiz),
        ),
    ),
    debugShowCheckedModeBanner: false,
    );
  }
}
