import 'package:flutter/material.dart';
import 'package:quiz/result.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  int score = 0;
  bool submitted = false;
  static Color optionColor = Color(0xff234969);

  Map<String, Color> submitColors = {};

  List<Map> questions = [
    {
      "question": "What is my Name?",
      "answer": "sam",
      "options": ["sam", "mike", "dave", "john"]
    },
    {
      "question": "What is my age?",
      "answer": "25",
      "options": ["22", "23", "24", "25"]
    }
  ];

  setOptionColor(){
   for (var option in questions[questionIndex]["options"]) {
     submitColors[option] = optionColor;
   } 
  }

  setSubmitColor(value) {
    if(!submitted) {
      submitted = true;
      if (questions[questionIndex]["answer"] != value) {
      setState(() {
        submitColors[value] = Colors.red;
        submitColors[questions[questionIndex]["answer"]] = Colors.green;
      });
    } else {
      setState(() {
        ++score;
        submitColors[value] = Colors.green;
      });
    }
    }
  }

  @override
  void initState() {
    super.initState();
    setOptionColor();
  }

  @override
  Widget build(BuildContext context) {
  
  Widget optionContainer(String option) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => {
          setSubmitColor(option)
        },
        child: Container(
          padding: EdgeInsets.only(
              top: 10, bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(
            color: submitted ? submitColors[option] : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: submitColors[option],
              width: 4,
            ),
          ),
          child: Row(
            children: [
              Text(
                option,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    return Scaffold(
      backgroundColor: Color(0xff172045),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text(
              'Score: '+score.toString()+' points',
              style: TextStyle(color: Color(0xff818baf), fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Question "+(questionIndex+1).toString(),
                    style: TextStyle(color: Color(0xff818baf), fontSize: 25),
                  ),
                  TextSpan(
                    text: "/"+questions.length.toString(),
                    style: TextStyle(
                      color: Color(0xff818baf),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              questions[questionIndex]["question"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Column(
              children: questions[questionIndex]["options"].map<Widget>((String text) => optionContainer(text)).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)
              ),
              onPressed: ()=>{
                setState(()=>{
                  if (questionIndex < questions.length-1){
                    ++questionIndex,
                    submitted= false,
                    submitColors = {},
                    setOptionColor(),
                  }
                  else{
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(score:score, total:questions.length)))
                  }
                })
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
