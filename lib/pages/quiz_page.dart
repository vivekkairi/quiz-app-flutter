import 'package:flutter/material.dart';
import 'package:quiz_app/pages/score_page.dart';
import 'package:quiz_app/utils/question.dart';
import 'package:flash/flash.dart';

class QuizTest extends StatefulWidget {
  @override
  _QuizTestState createState() => _QuizTestState();
}

class _QuizTestState extends State<QuizTest> {

  Quiz quiz = Quiz([
    Question("___ is a programming language", ['HTML', 'CSS', 'JS', 'PHP'], 3),
    Question("___ is a scripting language", ['Go', 'Python', 'JS', 'PHP'], 4),
    Question("___ is a programming language", ['HTML', 'CSS', 'JS', 'PHP'], 3),
    Question("___ is a scripting language", ['Go', 'Python', 'JS', 'PHP'], 4),
    Question("___ is a programming language", ['HTML', 'CSS', 'JS', 'PHP'], 3),
    Question("___ is a scripting language", ['Go', 'Python', 'JS', 'PHP'], 4),
  ]);
  Question currentQuestion;
  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQtn();
  }

  void sendAns(int id) {
    if(currentQuestion.checkAns(id)){
      quiz.score++;
    }
    currentQuestion = quiz.nextQtn();
    if(currentQuestion == null){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ScorePage(quiz.score,quiz.questions.length)));
    }else 
      this.setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff212121),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(currentQuestion.question, style: TextStyle(color: Colors.white, fontSize: 30),),
          Padding(padding: EdgeInsets.only(bottom: 30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){sendAns(1);},
                child: Text(currentQuestion.options[0]),
              ),
              RaisedButton(
                onPressed: (){sendAns(2);},
                child: Text(currentQuestion.options[1]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){sendAns(3);},
                child: Text(currentQuestion.options[2]),
              ),
              RaisedButton(
                onPressed: (){sendAns(4);},
                child: Text(currentQuestion.options[3]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  currentQuestion = quiz.nextQtn();
                  if(currentQuestion == null){
                    showFlash(
                      context: context,
                      duration: Duration(seconds: 2),
                      builder: (context, controller) {
                        return Flash(
                          backgroundColor: Color(0xff212121),
                          controller: controller,
                          style: FlashStyle.grounded,
                          boxShadows: kElevationToShadow[4],
                          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
                          child: FlashBar(
                            message: Text('No questions available', style: TextStyle(color: Colors.white),),
                          ),
                        );
                      },
                    );
                    currentQuestion = quiz.prevQtn();
                  }
                  this.setState((){});
                },
                child: Text("Next"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  currentQuestion = quiz.prevQtn();
                  if(currentQuestion == null){
                    showFlash(
                      context: context,
                      duration: Duration(seconds: 2),
                      builder: (context, controller) {
                        return Flash(
                          backgroundColor: Color(0xff212121),
                          controller: controller,
                          style: FlashStyle.grounded,
                          boxShadows: kElevationToShadow[4],
                          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
                          child: FlashBar(
                            message: Text('Already at the start', style: TextStyle(color: Colors.white),),
                          ),
                        );
                      },
                    );
                    currentQuestion = quiz.nextQtn();
                  }
                  this.setState((){});
                },
                child: Text("Prev"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
