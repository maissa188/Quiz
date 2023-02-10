
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
 final int resultScore;
 final VoidCallback resetHandler;
Result(this.resultScore,this.resetHandler);

String get resultPhrase {
 String resultText;
  if(resultScore <=8){
    resultText='you are awesome and innocent';
  }else if (resultScore <=12){
  resultText='you are  likeable';
  }else if(resultScore <= 16){
     resultText='you are strange ?!!';
  }else{
      resultText='you are so bad !';
  }
  return resultText;
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(15)),
          Text(resultPhrase,
          style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.blue),
          textAlign: TextAlign.center,
          ),
          Text(
            'Score' '$resultScore',
style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 10, 129, 226)),
),
            onPressed: resetHandler, child: Text('Restart Quiz'))
        ],
        
      ),
      
    );
    
  }
}