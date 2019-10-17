import 'package:flutter/material.dart';
import 'package:quiz_app/pages/landing_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff212121),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your score: ", style: TextStyle(color: Colors.white, fontSize: 40)),
          Text(score.toString()+"/"+totalQuestions.toString(), style: TextStyle(color: Colors.white, fontSize: 40),),
          IconButton(
            padding: EdgeInsets.only(top: 10),
            icon: Icon(Icons.arrow_right),
            iconSize: 50,
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> LandingPage()));
            },
          )
        ],
      ),
    );
  }
}