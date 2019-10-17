class Question {
  String question;
  List<String> options;
  int answer;
  Question(this.question, this.options, this.answer);

  bool checkAns(int ansIndex) {
    if(ansIndex == answer)
      return true;
    else
      return false;
  }
}

class Quiz {
  List<Question> questions;
  int _index=0;
  int score = 0;
  Quiz(this.questions);
  int get index => _index;
  Question nextQtn() {
    if(_index >= questions.length)
      return null;
    _index++;
    print(_index-1);
    return questions[_index-1];
  }

  Question prevQtn() {
    _index--;
    if(_index >= questions.length)
      return null;
    return questions[_index-1];
  }
}