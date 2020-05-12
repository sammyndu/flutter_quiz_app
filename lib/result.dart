import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key key, this.score, this.total}) : super(key: key);

  final int score;
  final int total;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  margin: EdgeInsets.all(30),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Your Score: \n",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            score.toString()+"/"+total.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),),
                    ),
                  ),
                ),
              RaisedButton(
                elevation: 10,
                color: Colors.blue,
                child: Text(
                  "Restart Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage()))
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}
