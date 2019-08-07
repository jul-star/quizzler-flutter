import 'question.dart';
class Victorine
{
  List<Question> Questions = [];
  Victorine(){}
  void Add(Question q)
  {
    Questions.add(q);
  }
  Question At(int Index)
  {
    return Questions[Index];
  }

}