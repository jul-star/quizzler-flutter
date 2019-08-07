import 'question.dart';

class Victorine {
  List<Question> _Questions = [];
  Victorine();
  void Add(Question q) {
    _Questions.add(q);
  }

  String Text(int Index) {
    return _Questions[Index].vQuestion;
  }

  bool Correct(int Index) {
    return _Questions[Index].vAnswer;
  }
}
