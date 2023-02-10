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
          {'text':'Red','score':5},
         {'text':'White','score':6},
          {'text':'Blue','score':8},
          {'text':'Green','score':5},
          ],
      },
      {
        'questionText':'what\'s your favorite animal ?',
        'answers':[
          {'text':'Rabbit','score':5},
          {'text':'snake','score':2},
          {'text':'Elephant','score':6},
          {'text':'Lion','score':7}
          ],
      },
         {
        'questionText':'what\'s your favorite kind of movie ?',
        'answers':[
           {'text':'Romance','score':5},
            {'text':'Comedy','score':3},
             {'text':'Action','score':2},
              {'text':'Drama','score':7},
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
