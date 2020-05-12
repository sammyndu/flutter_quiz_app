import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

class StartPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff172045),
        body: Center(
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              "Take Quiz",
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
      ),
    );
  }
}
